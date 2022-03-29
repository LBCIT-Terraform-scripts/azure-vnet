# Resource-1: Azure Resource Group

resource "azurerm_resource_group" "resource_group_name" {
  # name = "${local.resource_name_prefix}-${var.resource_group_name}" ---> for develpomet or production only
  name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.my_random.id}" # for practical use only 
  location = var.resource_group_location
  tags     = local.common_tags
}

