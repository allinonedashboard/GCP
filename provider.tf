//provider "google" {
//  credentials = file("gcp-cred.json") //export GCLOUD_ZONE=""
//  project     = var.project_name      //export GCLOUD_ZONE=""
//  region      = var.region            //export GCLOUD_ZONE=""
//  zone        = "us-west1-c"          //export GCLOUD_ZONE=""
//}

//terraform {
//  required_version = "~> 0.13"
//  required_providers {
//    mycloud ={
//      source = "hashicorp/kubernetes"
//      version = "~> 0.13"
//    }
//  }
//  backend "local" {
//    path = "terraform.tfstate"
//  }
//}

//provider "kubernetes" {
// // host = "https://127.0.0.1:55948"
//  config_path    = "~/.kube/config"
//  config_context = "kind-kind"
//}
//
//provider "helm" {
//  kubernetes {
//    config_path = "~/.kube/config"
//  }
//}
