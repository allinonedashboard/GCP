output "vpc_self_link" {
  value = google_compute_network.vpc_net.self_link
}

output "subnet_self_link" {
  value = google_compute_subnetwork.vpc_subnet.self_link
}