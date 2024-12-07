terraform {
  required_version = "1.10.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.12.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "azrgcttfpoc01"
    storage_account_name = "azstacttfpoc01"
    container_name       = "tfstate"
    key                  = "poc-databricks/vnet.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "735a0d05-feb8-4c83-ac1b-f29072c3d5a5"
}
