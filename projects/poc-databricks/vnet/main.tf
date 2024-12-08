data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    resource_group_name  = "azrgcttfpoc01"
    storage_account_name = "azstacttfpoc01"
    container_name       = "tfstate"
    key                  = "poc-databricks/resource-group.tfstate"
  }
}

module "vnet_01" {
  source              = "github.com/chut-th/terraform-azurerm-vnet"
  company             = "ct"
  environment         = "poc"
  location            = data.terraform_remote_state.rg.outputs.resource_group_nw_01_location
  project             = "shi"
  running_number      = "01"
  resource_group_name = data.terraform_remote_state.rg.outputs.resource_group_nw_01_name
  address_space       = ["10.0.0.0/24"]
}
