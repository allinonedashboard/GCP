resource "google_storage_bucket" "buckets" {
  name          = var.bucketname #auto-expiring-bucket-123654788
  location      = var.location
  force_destroy = true
  lifecycle_rule {
    condition {
      age = var.lifecycleruleage
    }
    action {
      type = "Delete"
    }
  }
}