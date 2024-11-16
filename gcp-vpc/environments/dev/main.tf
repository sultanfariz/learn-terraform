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

# Call the network module
module "network" {
  source = "../../modules/network"
  # Input variables for the network module
  ip_range   = "10.0.0.0/16"
  region     = var.region
  zone       = var.zone
  project_id = var.project_id

  # # Other network-specific inputs
  # environment = "dev"
}

# Call the compute module (e.g., for EC2 instances)
module "compute" {
  source = "../../modules/compute"
  # Input variables for the compute module
  instance_type = "f1-micro"
  project_id    = var.project_id
  vpc_network   = module.network.net1.name

  # # Other compute-specific inputs
  # environment = "dev"
}

# # Call the data module (e.g., for S3 buckets)
# module "data" {
#     source = "../../modules/data"
#     bucket_name = "dev-bucket"
#     environment = "dev"
# }
