# Resource-1: Create bastionTier Subnet
resource "azurerm_subnet" "bastion_subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.bastion_subnet_name}"
  address_prefixes     = var.bastion_address_space
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
# Resource-2: Create Network Security Group (NSG)
resource "azurerm_network_security_group" "bastion_nsg" {
  name                = "${azurerm_subnet.bastion_subnet.name}-nsg"
  location            = azurerm_virtual_network.vnet.location
  resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  tags                = local.common_tags
}

# Resource-3: Associate NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "bastion_subnet_nsg_association" {
   # depends_on = [ azurerm_network_security_rule.bastion_nsg_rule_inbound ]
  network_security_group_id = azurerm_network_security_group.bastion_nsg.id
  subnet_id                 = azurerm_subnet.bastion_subnet.id
}

# Resource-4: Create NSG Rules
## Locals Block for security rules ## 80,443, 8080, 8081, 8082, 9090,9091

locals {
  bastion_nsg_rule_inbound_ports = {
    "100" : "22" # if key starts with a number, you must use the colon syntax 
    "110" : "443"
    "120" : "3389"
  }

}

## NSG Inbound Rule for bastionTier Subnets
resource "azurerm_network_security_rule" "bastion_nsg_rule_inbound" {
  for_each                    = local.bastion_nsg_rule_inbound_ports
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.bastion_nsg.name
  resource_group_name         = azurerm_network_security_group.bastion_nsg.resource_group_name
}


## Locals Block for security rules
## NSG Inbound Rule for WebTier Subnets