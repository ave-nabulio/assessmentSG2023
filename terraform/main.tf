resource "random_pet" "rg_name" {
  prefix    = var.resource_group_name_prefix
  separator = "" # Apparently, only numbers and letters in the names in Azure.
}

resource "random_pet" "ba_name" {
  prefix    = var.batch_account_name_prefix
  separator = ""
}

resource "random_pet" "pool_name" {
  prefix    = var.batch_pool_name_prefix
  separator = ""
}

resource "random_pet" "job_name" {
  prefix    = var.batch_job_name_prefix
  separator = ""
}

resource "random_pet" "task_name" {
    prefix    = var.batch_task_name_prefix
    separator = ""
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

resource "azurerm_batch_account" "batch_account" {
  name                 = random_pet.ba_name.id
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  pool_allocation_mode = "BatchService"
}

resource "azurerm_batch_pool" "pool" {
  name                = random_pet.pool_name.id
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_batch_account.batch_account.name
  vm_size             = "standard_d2s_v3"
  node_agent_sku_id   = "batch.node.ubuntu 20.04"

  storage_image_reference {
    publisher = "microsoft-azure-batch"
    offer     = "ubuntu-server-container"
    sku       = "20-04-lts"
    version   = "latest"
  }

  auto_scale {
    formula             = <<EOF
      startingNumberOfVMs = 1;
      maxNumberofVMs = 25;
      pendingTaskSamplePercent = $PendingTasks.GetSamplePercent(180 * TimeInterval_Second);
      pendingTaskSamples = pendingTaskSamplePercent < 70 ? startingNumberOfVMs : avg($PendingTasks.GetSample(180 *   TimeInterval_Second));
      $TargetDedicatedNodes=min(maxNumberofVMs, pendingTaskSamples);
EOF
    evaluation_interval = "PT5M"
  }
}

resource "azurerm_batch_job" "job1" {
  name                = "minimalrequirementjob"
  batch_pool_id       = azurerm_batch_pool.pool.id

}