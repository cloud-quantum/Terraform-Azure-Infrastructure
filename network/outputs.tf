output "vnet_id" {
  value       = module.azure_vnet.vnet_id
  description = "The ID of the virtual network."
}

output "app_subnet_ids" {
  value       =  module.azure_vnet.app_subnet_ids
  description = "The IDs of public subnets in the virtual network."
}

output "db_subnet_ids" {
  value       =  module.azure_vnet.db_subnet_ids 
  description = "The IDs of private subnets in the virtual network."
}

output "nsg_id" {
  value       = module.azure_vnet.nsg_id
  description = "The ID of the network security group."
}