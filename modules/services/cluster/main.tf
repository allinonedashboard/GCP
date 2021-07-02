resource "google_container_cluster" "default" {
  name     = var.clustername
  location = var.location
  project = var.project
  remove_default_node_pool = true
  initial_node_count       = var.nodecount
  network            = var.vpc_selflink
  subnetwork         = var.subnet_selflink

  ip_allocation_policy{
    cluster_secondary_range_name = var.cluster_secondary_name
    services_secondary_range_name = var.cluster_service_name
  }
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.nodepoolname
  location   = var.location
  cluster    = google_container_cluster.default.name
  node_count = var.nodecount

  autoscaling {
    min_node_count = var.autoscaling_min_node_count
    max_node_count = var.autoscaling_max_node_count
  }

  node_config {
    preemptible  = true
    machine_type = var.machinetype

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_write",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}