# Generic Input Variables

# Business Divission
variable "business_division" {
  type        = string
  description = "Business Division to which this infrastructure belongs to "
  default     = "telsus"
}

# Environment Variables
variable "environment" {
  description = "Environment Variable used as a prefix"
  default     = "dev"
}

# Azure Resources Location
variable "resource_group_name" {
  description = "Resource Group Name"
  default     = "rg-default"
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  default     = "canadacentral"
}

# Azure Client_id 
variable "client_id" {
  type        = string
  description = "Enter your client_id"
}

# Azure Subcription ID
variable "subscription_id" {
  type        = string
  description = "Enter your subscription_id"
}

# Azure tenant_id
variable "tenant_id" {
  type        = string
  description = "Enter your tenant_id"
}

# Azure client_id
variable "client_secret" {
  type        = string
  description = "Enter your client_secret"
}


