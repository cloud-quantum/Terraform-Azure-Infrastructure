module "azure_vnet" {
  source = "../modules/azure_vnet"

  vnet_name           = var.vnet_configuration.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  address_space       = var.vnet_configuration.address_space
  app_subnets         = var.vnet_configuration.app_subnets 
  db_subnets          = var.vnet_configuration.db_subnets 
  tags                = {
    ManagedBy = "Terraform"
    env       = terraform.workspace
  }
}
