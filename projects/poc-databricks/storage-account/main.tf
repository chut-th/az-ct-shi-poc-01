data "terraform_remote_state" "rg" {
  backend = "azurerm"
  config = {
    resource_group_name  = "azrgcttfpoc01"
    storage_account_name = "azstacttfpoc01"
    container_name       = "tfstate"
    key                  = "poc-databricks/resource-group.tfstate"
  }
}


module "sta_01" {
  source                   = "github.com/chut-th/terraform-azurerm-storage-account"
  company                  = "ct"
  environment              = "poc"
  project                  = "shi"
  running_number           = "01"
  resource_group_name      = data.terraform_remote_state.rg.outputs.resource_group_sta_01_name
  location                 = data.terraform_remote_state.rg.outputs.resource_group_sta_01_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
