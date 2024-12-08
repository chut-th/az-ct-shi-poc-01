data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    resource_group_name  = "azrgcttfpoc01"
    storage_account_name = "azstacttfpoc01"
    container_name       = "tfstate"
    key                  = "poc-databricks/resource-group.tfstate"
  }
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "azrgcttfpoc01"
    storage_account_name = "azstacttfpoc01"
    container_name       = "tfstate"
    key                  = "poc-databricks/vnet.tfstate"
  }
}

module "subnet_01" {
  source               = "github.com/chut-th/terraform-azurerm-subnet"
  company              = "ct"
  environment          = "poc"
  project              = "shi"
  running_number       = "01"
  resource_group_name  = data.terraform_remote_state.rg.outputs.resource_group_nw_01_name
  virtual_network_name = data.terraform_remote_state.vnet.outputs.vnet_01_name
  address_prefixes     = ["10.0.0.0/26"]
}

module "subnet_02" {
  source               = "github.com/chut-th/terraform-azurerm-subnet"
  company              = "ct"
  environment          = "poc"
  project              = "shi"
  running_number       = "02"
  resource_group_name  = data.terraform_remote_state.rg.outputs.resource_group_nw_01_name
  virtual_network_name = data.terraform_remote_state.vnet.outputs.vnet_01_name
  address_prefixes     = ["10.0.0.64/26"]
}
