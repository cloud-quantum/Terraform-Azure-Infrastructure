module "azure_aks" {
  source              = "../modules/azure_aks"
  name                = var.aks_configuration.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  node_resource_group = var.aks_configuration.node_resource_group
  vnet_subnet_id      = local.app_subnet_ids["app-subnet-dev-1"]
  dns_prefix          = var.aks_configuration.name
  kubernetes_version  = var.aks_configuration.kubernetes_version

  agent_pool_profiles = local.updated_agent_pool_profiles
}