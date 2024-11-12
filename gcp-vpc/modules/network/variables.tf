variable ip_range {
  type        = string
  default     = "10.0.0.0/16"
  description = "IP range for the network"
}

variable region {
  type        = string
  default     = "us-central"
  description = "Region for the network"
}

variable zone {
  type        = string
  default     = "us-central1-f"
  description = "Zone for the network"
}