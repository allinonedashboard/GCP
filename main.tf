//module "bucket" {
//  source = "./modules/services/bucket"
//  bucketname = "auto-expiring-bucket-123654788"
//  location = var.location
//  lifecycleruleage = 3
//}
//
module "cluster" {
  source = "./modules/services/cluster"
  clustername = "my-gke-cluster"
  location = var.region
  project = var.project_name
  nodecount = 1
  nodepoolname = "my-node-pool"
  machinetype = var.machinetype
  vpc_selflink = module.network.vpc_self_link
  subnet_selflink = module.network.subnet_self_link
  cluster_secondary_name = "gke-pods-1"
  cluster_service_name = "gke-services-1"
}

module "network" {
  source = "./modules/services/network"
  network = var.network_name
  project = var.project_name
  region = var.region
  subnetwork = "gke-subnet-1"
  subnetwork_range = "192.168.0.0/20"
  cluster_name = "gke-e2e-demo"
  cluster_secondary_name = "gke-pods-1"
  cluster_secondary_range ="10.4.0.0/14"
  cluster_service_name = "gke-services-1"
  cluster_service_range ="10.0.32.0/20"
  firewall_name = "fw-allow-ssh-bastion"
}
//
//module "iam" {
//  source = "./modules/services/iam"
//  project = var.project_name
//}
//
//resource "kubernetes_deployment" "mypod" {
//  metadata {
//    name = "hello"
//  }
//  spec {
//    selector {
//      match_labels = {
//        "app" = "heloworld"
//      }
//    }
//    replicas = 1
//    template {
//      metadata {
//        labels = {
//          "app" = "heloworld"
//        }
//      }
//      spec {
//        container {
//          name = "hellocontainer"
//          image = "grafana/grafana:latest"
//          port {
//            container_port = 9000
//          }
//        }
//      }
//    }
//  }
//}

//data "google_secret_manager_secret_version" "basic" {
//  secret = "username"
//}

//
//resource helm_release grafana {
//  name       = "etms-grafana"
//  repository = "https://grafana.github.io/helm-charts"
//  chart      = "grafana"
//}