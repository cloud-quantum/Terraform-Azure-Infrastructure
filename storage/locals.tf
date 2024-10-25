locals {
  app_subnet_ids  = data.terraform_remote_state.network.outputs.app_subnet_ids
  db_subnet_ids   = data.terraform_remote_state.network.outputs.db_subnet_ids
  vnet_id         = data.terraform_remote_state.network.outputs.vnet_id
}
