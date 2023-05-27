variable "Resource_Group" {
  description = "Resource Group Name to be provisioned for the Terraform project"
  type        = string
  default     = "FrontDoorExampleResourceGroup"
}

variable "Front_door" {
  description = "Frontdoor Name to be used for the Terraform project"
  type        = string
  default     = "example-FrontDoor-76578"
}

variable "frontend_with_disabled_waf_rules" {}
variable env {}
variable backend_domain {
  type = list
}
variable custom_domain_name {}