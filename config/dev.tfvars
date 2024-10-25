resource_group_name = "psychplus-dev"
resource_group_location = "East US"
vnet_configuration = {
  vnet_name           = "dev-vnet"
  address_space       = ["10.254.0.0/16"]

  app_subnets = [
    {
      name              = "app-subnet-dev-1"
      address_prefixes  = ["10.254.0.0/21"]
      service_endpoints = []
    },
    {
      name              = "app-subnet-dev-2"
      address_prefixes  = ["10.254.8.0/21"]
      service_endpoints = []
    }
  ]

  db_subnets = [
    {
      name              = "db-subnet-dev-1"
      address_prefixes  = ["10.254.16.0/21"]
      service_endpoints = ["Microsoft.Storage"]
    },
    {
      name              = "db-subnet-dev-2"
      address_prefixes  = ["10.254.24.0/21"]
      service_endpoints = ["Microsoft.Storage"]
    }
  ]
}

aks_configuration = {
  name                = "dev-aks-shared-001"
  node_resource_group = "psychplus-dev-aks-nodegroup"
  kubernetes_version  = "1.29"

  agent_pool_profiles = [
    {
        name                = "nodepool1"
        count               = 1
        vm_size             = "Standard_D2s_v3"
        os_disk_size_gb     = 30
        max_pods            = 30
        os_type             = "Linux"
        enable_auto_scaling = true
        min_count           = 1
        max_count           = 2
        scale_down_mode     = "Delete"
    }
   ]
}

acr_configuration = {
  name                = "devcrppluseus1"
  sku_name            = "Standard"
  admin_user_enabled  = true
}