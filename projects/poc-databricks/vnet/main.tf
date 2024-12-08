# data "terraform_remote_state" "rg" {
#   backend = "azurerm"
#   config = {
#     resource_group_name  = "azrgcttfpoc01"
#     storage_account_name = "azstacttfpoc01"
#     container_name       = "tfstate"
#     key                  = "poc-databricks/resource-group.tfstate"
#   }
# }

module "vnet_01" {
  source      = "../../../modules/vnet"
  company     = "ct"
  environment = "poc"
  # location            = data.terraform_remote_state.rg.outputs.resource_group_nw_01_location
  location       = "southeastasia"
  project        = "shinw"
  running_number = "02"
  # resource_group_name = data.terraform_remote_state.rg.outputs.resource_group_nw_01_name
  resource_group_name = "azrgctshinwpoc01"
  address_space       = ["10.0.0.0/24"]
}
