variable "resource_group_location" {
  default     = "France Central"
  description = "Location of the resource group."
}

variable "resource_group_name_prefix" {
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "batch_account_name_prefix" {
  default     = "ba"
  description = "Prefix of the batch account name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "batch_pool_name_prefix" {
  default = "pool"
  description = "Prefix of the batch pool name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "batch_job_name_prefix" {
  default = "job"
  description = "Prefix of the batch job name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "batch_task_name_prefix" {
  default = "task"
  description = "Prefix of the batch task name that's combined with a random ID so name is unique in your Azure subscription."
}