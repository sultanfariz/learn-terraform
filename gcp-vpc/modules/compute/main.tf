module "network" {
    source = "../network"
    # Add any required variables for the source module
    project_id = var.project_id
    region     = var.region
    zone       = var.zone
}

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.10.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_instance" "vm_instance" {
  name         = "vm-instance"
  machine_type = var.instance_type
  zone         = module.network.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = module.network.vpc_network
    access_config {}
  }
}