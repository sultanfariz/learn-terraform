terraform {
  backend "gcs" {
    bucket = "sultan-n2765v3l"
    prefix = "terraform/state"
  }
}
