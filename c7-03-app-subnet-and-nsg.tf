# Resource-1: Create App Subnet 
resource "azurerm_subnet" "app_subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.app_subnet_name}"
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app_address_space
}

# Resource-2: App security group
resource "azurerm_network_security_group" "app_nsg" {
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  name                = "${azurerm_subnet.app_subnet.name}-nsg"
  location            = azurerm_virtual_network.vnet.location
  tags                = local.common_tags
}

# Resource-3: Associate app_nsg and app_subnet
resource "azurerm_subnet_network_security_group_association" "app_nsg_association" {
  # depends_on = [ azurerm_network_security_rule.app_nsg_inbound_rule ]
  subnet_id                 = azurerm_subnet.app_subnet.id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
}

# Resource-4: Create NSG Rules
## Locals Block for security rules ## 80,443, 8080, 8081, 8082, 9090,9091

locals {
  app_nsg_rule = {
    "100" : "80"
    "120" : "8080"
    "130" : "9090"
  }
}
resource "azurerm_network_security_rule" "app_nsg_inbound_rule" {
  for_each                    = local.app_nsg_rule
  name                        = "app_port_rule-${each.value}"
  protocol                    = "Tcp"
  resource_group_name         = azurerm_virtual_network.vnet.resource_group_name
  network_security_group_name = azurerm_network_security_group.app_nsg.name
  direction                   = "Inbound"
  priority                    = each.key
  access                      = "Allow"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}
