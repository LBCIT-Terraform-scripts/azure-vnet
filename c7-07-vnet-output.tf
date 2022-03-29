# Virtual Network
## Virtual Network Name
output "virtual_network_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.vnet.name
}

# Virtual Network ID - virtual_network_id
output "virtual_network_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

# Subnet Outputs
## Subnet Name - web_subnet_name

output "web_subnet_name" {
  value       = azurerm_subnet.web_subnet.name
  description = "Web Subnet Name"
}

output "web_subnet_ID" {
  value       = azurerm_subnet.web_subnet.id
  description = "Web Subnet ID"
}

# Subnet Outputs
## Subnet Name - app_subnet_name

output "app_subnet_name" {
  value       = azurerm_subnet.app_subnet.name
  description = "App Subnet Name"
}

output "app_subnet_ID" {
  value       = azurerm_subnet.app_subnet.id
  description = "App Subnet ID"
}

# Subnet Outputs
## Subnet Name - bastion_subnet_name

output "bastion_subnet_name" {
  value       = azurerm_subnet.web_subnet.name
  description = "Bastion Subnet Name"
}

output "bastion_subnet_ID" {
  value       = azurerm_subnet.bastion_subnet.id
  description = "Bastion Subnet ID"
}


output "test_location" {
  value = azurerm_network_security_group.db_nsg.location
}