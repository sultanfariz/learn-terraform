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

# vpc 2
resource "google_compute_network" "net2" {
  name                    = "net2"
  auto_create_subnetworks = false
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

# peering between vpc 1 and vpc 2
resource "google_compute_network_peering" "peer1" {
  name         = "vpc1-to-vpc2"
  network      = google_compute_network.net1.self_link
  peer_network = google_compute_network.net2.self_link
}

resource "google_compute_network_peering" "peer2" {
  name         = "vpc2-to-vpc1"
  network      = google_compute_network.net2.self_link
  peer_network = google_compute_network.net1.self_link
}
