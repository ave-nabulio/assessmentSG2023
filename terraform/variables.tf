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

variable "batch_pool_start_vm_number" {
  default = 1
  description = "Number of VMs to start in the pool"
}

variable "batch_pool_max_vm_number" {
  default = 25
  description = "Maximum number of VMs in the pool"
}
