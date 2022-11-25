variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default     = "example-resources"
}

variable "location" {
  description = "(Optional) The location in which the resources will be created."
  type        = string
  default     = "West Europe"
}
