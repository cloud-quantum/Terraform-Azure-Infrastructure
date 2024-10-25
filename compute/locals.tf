locals {
  app_subnet_ids  = data.terraform_remote_state.network.outputs.app_subnet_ids
  db_subnet_ids   = data.terraform_remote_state.network.outputs.db_subnet_ids
  vnet_id         = data.terraform_remote_state.network.outputs.vnet_id

  updated_agent_pool_profiles = [
    for profile in var.aks_configuration.agent_pool_profiles : {
      name                = profile.name
      count               = profile.count
      vm_size             = profile.vm_size
      os_disk_size_gb     = profile.os_disk_size_gb
      max_pods            = profile.max_pods
      os_type             = profile.os_type
      enable_auto_scaling = profile.enable_auto_scaling
      min_count           = profile.min_count
      max_count           = profile.max_count
      scale_down_mode     = profile.scale_down_mode
      vnet_subnet_id      = local.app_subnet_ids["app-subnet-dev-1"]
    }
  ]
}
