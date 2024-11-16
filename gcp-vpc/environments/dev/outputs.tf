output "vpc1_name" {
  value = module.network.net1.name
}

output "vpc2_name" {
  value = module.network.net2.name
}

output "vpc1_id" {
  value = module.network.net1.id
}

output "vpc2_id" {
  value = module.network.net2.id
}

output "peering_status" {
  value = module.network.peering_status
}

output "vm_instance_name" {
  value = module.compute.instance_name
}

output "vm_instance_external_ip" {
  value = module.compute.instance_ip
}
