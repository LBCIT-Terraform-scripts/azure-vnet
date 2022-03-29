# Terraform Settings Block
terraform {
  required_version = "~> 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }

  backend "azurerm" {
    # container_name = "tfstatefiles"
    # key = "project-1-canadacentral-terraform.tfstate"
    # storage_account_name = "terraformstatecanada"
    # resource_group_name = "terraform-remote-storage-rg"
    # sas_token = ""
  }
}






# Provider Block
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id     # appId : 
  client_secret   = var.client_secret #"password" 
}

