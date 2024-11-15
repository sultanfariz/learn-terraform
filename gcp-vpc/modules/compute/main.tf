resource "google_compute_instance" "vm_instance" {
  name         = "vm-instance"
  machine_type = var.instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = var.vpc_network
    access_config {}
  }

}
