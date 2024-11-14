terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.10.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "net1" {
  name = "net1"
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.net1.name
  region        = var.region
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  network       = google_compute_network.net1.name
  region        = var.region
}

resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.net1.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = [var.ip_range]
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.net1.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = [var.ip_range]
}

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = google_compute_network.net1.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = [var.ip_range]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.net1.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.ip_range]
}

resource "google_compute_network" "net2" {
  name = "net2"
}

resource "google_compute_subnetwork" "subnet3" {
  name          = "subnet-3"
  ip_cidr_range = "10.1.1.0/24"
  network       = google_compute_network.net2.name
  region        = var.region
}

resource "google_compute_subnetwork" "subnet4" {
  name          = "subnet-4"
  ip_cidr_range = "10.1.2.0/24"
  network       = google_compute_network.net2.name
  region        = var.region
}
