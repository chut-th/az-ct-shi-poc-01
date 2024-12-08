module "resource_group_nw_01" {
  source         = "github.com/chut-th/terraform-azurerm-resource-group"
  company        = "ct"
  environment    = "poc"
  location       = "southeastasia"
  project        = "shinw"
  running_number = "01"
}

module "resource_group_sta_01" {
  source         = "github.com/chut-th/terraform-azurerm-resource-group"
  company        = "ct"
  environment    = "poc"
  location       = "southeastasia"
  project        = "shista"
  running_number = "01"
}