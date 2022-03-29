# Define Local Values  in Terraform
locals {
  environment          = var.environment
  owners               = var.business_division
  resource_location    = var.resource_group_location
  resource_name_prefix = "${var.business_division}-${var.environment}-${var.resource_group_location}"
  # Map starts with flower bracket
  common_tags = {
    owners      = local.owners,
    environment = local.environment
  }
}

