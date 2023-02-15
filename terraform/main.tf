resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

## Locate the existing custom image
#data "azurerm_image" "image" {
#  name                = "ubuntu-18-04-lts-samtools"
#  resource_group_name = azurerm_resource_group.rg.name
#}

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

  storage_image_reference {
    publisher = "microsoft-azure-batch"
    offer     = "ubuntu-server-container"
    sku       = "20-04-lts"
    version   = "latest"
  }

#  storage_image_reference {
#    id = data.azurerm_image.image.id
#  }

  auto_scale {
    formula             = <<EOF
      startingNumberOfVMs = ${var.batch_pool_start_vm_number};
      maxNumberofVMs = ${var.batch_pool_max_vm_number};
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