# Virtual Network, Subnets and Subnet NSG's

# Virtual Network
variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "vnet-default"
}

# Virtual Network Address Space
variable "vnet_address_space" {
  type        = list(string)
  description = "Virtual Network Address Space"
  default     = ["10.0.0.0/16"]
}

# Web Subnet  Address Space
variable "web_address_space" {
  type        = list(string)
  description = "Virtual Networt Web Subnet Address Space"
  default     = ["10.0.1.0/24"]
}

# Web Subnet Name
variable "web_subnet_name" {
  type        = string
  description = "virtual Network Web Subnet Name"
  default     = "websubnet"
}

# App Subnet Name 
variable "app_subnet_name" {
  type        = string
  description = "virtual Network App Subnet Name"
  default     = "appsubnet"
}

# App Subnet Address Space
variable "app_address_space" {
  type        = list(string)
  description = "Virtual Networt App Subnet Address Space"
  default     = ["10.0.21.0/24"]
}


# Bastion Subnet Name 
variable "bastion_subnet_name" {
  type        = string
  description = "virtual Network Bastion Subnet Name"
  default     = "bastionsubnet"
}

# Bastion Subnet Address Space
variable "bastion_address_space" {
  type        = list(string)
  description = "Virtual Networt Bastion Subnet Address Space"
  default     = ["10.0.100.0/24"]
}


# db Subnet Name 
variable "db_subnet_name" {
  type        = string
  description = "virtual Network Bastion Subnet Name"
  default     = "dbsubnet"
}

# db Subnet Address Space
variable "db_address_space" {
  type        = list(string)
  description = "Virtual Networt DB Subnet Address Space"
  default     = ["10.0.120.0/24"]
}
