resource "random_string" "random" {
  length  = 8
  upper   = false
  special = false
}

resource "google_storage_bucket" "tf_state_bucket" {
  name          = "sultan-${random_string.random.result}"
  location      = "US"
  force_destroy = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 30
    }

    action {
      type = "Delete"
    }
  }
}
