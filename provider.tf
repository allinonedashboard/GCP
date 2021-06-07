provider "google" {
  credentials = file("gcp-cred.json") //export GCLOUD_ZONE=""
  project = var.project_name //export GCLOUD_ZONE=""
  region = var.region //export GCLOUD_ZONE=""
  zone = "us-west1-c" //export GCLOUD_ZONE=""
}

