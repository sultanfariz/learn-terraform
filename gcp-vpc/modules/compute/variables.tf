variable ip_range {
  type        = string
  default     = "10.0.0.0/16"
  description = "IP range for the network"
}

variable region {
  type        = string
  default     = "us-central1"
  description = "Region for the network"
}

variable zone {
  type        = string
  default     = "us-central1-f"
  description = "Zone for the network"
}

variable "instance_type" {
  type        = string
  default     = "f1-micro"
  description = "Instance type"
}

variable "project_id" {
  type        = string
  description = "The project ID"
}

variable "vpc_network" {
  description = "The VPC network to which the instances will be connected"
  type        = string
}