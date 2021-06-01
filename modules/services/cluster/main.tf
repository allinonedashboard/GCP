resource "google_container_cluster" "default" {
  name     = var.clustername
  location = var.location
  remove_default_node_pool = true
  initial_node_count       = var.nodecount
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.nodepoolname
  location   = var.location
  cluster    = google_container_cluster.default.name
  node_count = var.nodecount

  node_config {
    preemptible  = false
    machine_type = var.machinetype

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}