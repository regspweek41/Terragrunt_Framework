
variable "key_vault_name" {
  description = "The Name of the key vault"
  default     = "keyvault78658"
}

variable "location" {
  type        = string
  description = "The azure region where the Resource Group should exist"
  default     = "West Europe"
}

variable "RG_Name" {
  type        = string
  description = "The name which should be used for this Resource Group."
  default     = "RG"
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = true
}
