variable "resource_group_location" {
  default     = "France Central"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "resourcegroup1"
}

variable "batch_account_name" {
  default     = "batchaccount1"
}

variable "batch_pool_name" {
  default = "pool1"
}

output "id" {
  value = data.azurerm_resource_group.main.id
}