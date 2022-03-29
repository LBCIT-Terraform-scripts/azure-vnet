
# locals 
locals {
  environment = "dev"
  owner = "telsus"
  }


# Resource-2 Create Virtual Network
resource "azurerm_virtual_network" "myvnet1" {
  name                = "myfirstvirtualnetwork"
  location            = azurerm_resource_group.my_demo_rg2.location
  address_space       = ["10.1.0.0/16"]
  resource_group_name = azurerm_resource_group.my_demo_rg2.name

  tags = {
      environment = local.environment
  }
}



# Resource-3 Create Virtual Subnet
resource "azurerm_subnet" "public_subnet" {
  name                 = "public_subnet_01"
  virtual_network_name = azurerm_virtual_network.myvnet1.name
  resource_group_name  = azurerm_resource_group.my_demo_rg2.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Resource-4 Create Public IP Address

resource "azurerm_public_ip" "public_ip_01" {
  name                = "public_ip_address_01"
  resource_group_name = azurerm_resource_group.my_demo_rg2.name
  location            = azurerm_resource_group.my_demo_rg2.location
  allocation_method   = "Static"
  ip_version = "IPv4"
  sku = "Standard"
  availability_zone = "Zone-Redundant"
  domain_name_label = "myterraformlabel${random_uuid.dns.result}"
  tags = {
    environment = local.environment
    owner = local.owner
  }
}


# Resource-5 Create Newtork-Interface
resource "azurerm_network_interface" "network_interface-public" {
  name                = "mynic_1"
  resource_group_name = azurerm_resource_group.my_demo_rg2.name
  location            = azurerm_resource_group.my_demo_rg2.location
  ip_configuration {
    name                          = "external"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip_01.id
    subnet_id = azurerm_subnet.public_subnet.id 
  }

    tags = {
      environment = local.environment
  }


}