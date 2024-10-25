module "azure_acr" {
  source = "../modules/azure_acr"

  name                = var.acr_configuration.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku_name            = var.acr_configuration.sku_name
  admin_user_enabled  = var.acr_configuration.admin_user_enabled
  
  tags                = {
    ManagedBy = "Terraform"
    env       = terraform.workspace
  }
}

module "azure_postgres" {
  source    = "../modules/azure_postgres"
  subnet_id = local.db_subnet_ids[var.index]
}