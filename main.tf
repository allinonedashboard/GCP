resource "google_compute_instance" "myserver" {
  name = "myserver"
  machine_type = "f1-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default" // This Enable private IP Address
    access_config {} // This Enable Public IP Address
  }
}

resource "google_storage_bucket" "auto-expire" {
  name          = "auto-expiring-bucket-123654788"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}