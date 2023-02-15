resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

# Locate the existing resource group
data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

# Locate the existing custom image
data "azurerm_image" "main" {
  name                = "samtools-image"
  resource_group_name = var.resource_group_name
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "virtualmachines12352334"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_batch_account" "batch_account" {
  name                 = var.batch_account_name
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  pool_allocation_mode = "BatchService"
}

resource "azurerm_batch_pool" "pool" {
  name                = var.batch_pool_name
  resource_group_name = azurerm_resource_group.rg.name
  account_name        = azurerm_batch_account.batch_account.name
  vm_size             = "standard_d2s_v3"
  node_agent_sku_id   = "batch.node.ubuntu 20.04"

  #  storage_image_reference {
  #    publisher = "microsoft-azure-batch"
  #    offer     = "ubuntu-server-container"
  #    sku       = "20-04-lts"
  #    version   = "latest"
  #  }

  storage_image_reference {
    id = "${data.azurerm_image.main.id}"
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
  name          = "minimalrequirementjob"
  batch_pool_id = azurerm_batch_pool.pool.id
}

resource "azurerm_batch_job" "job2" {
  name          = "samtooljob"
  batch_pool_id = azurerm_batch_pool.pool.id
}