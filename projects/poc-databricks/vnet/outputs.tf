output "vnet_01_id" {
  description = "The virtual NetworkConfiguration ID."
  value       = module.vnet_01.virtual_network_id
}

output "vnet_01_name" {
  description = "The name of the virtual network."
  value       = module.vnet_01.virtual_network_name
}
