output "instance_name" {
  value       = google_compute_instance.vm_instance.name
  sensitive   = true
  description = "Instance name"
  depends_on  = []
}

output "instance_ip" {
  value       = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
  sensitive   = true
  description = "Instance IP"
  depends_on  = []
}
