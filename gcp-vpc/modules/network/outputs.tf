output "region" {
  value       = var.region
  sensitive   = true
  description = "GCP region"
  depends_on  = []
}

output "zone" {
  value       = var.zone
  sensitive   = true
  description = "GCP zone"
  depends_on  = []
}

output "ip_range" {
  value       = var.ip_range
  sensitive   = true
  description = "IP range for the network"
  depends_on  = []
}

output "net1" {
  value       = google_compute_network.net1
  sensitive   = true
  description = "VPC network name"
  depends_on  = []
}

output "net2" {
  value       = google_compute_network.net2
  sensitive   = true
  description = "VPC network name"
  depends_on  = []
}
