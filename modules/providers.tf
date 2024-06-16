terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.84.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Mehul_RG"
    storage_account_name = "mehulmodulesa"
    container_name       = "backendtfstate"
    key                  = "module.terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}