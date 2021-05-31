provider "google" {
  credentials = file("gcp-cred.json") //export GCLOUD_ZONE=""
  project = "able-river-315213" //export GCLOUD_ZONE=""
  region = "us-west1" //export GCLOUD_ZONE=""
  zone = "us-west1-c" //export GCLOUD_ZONE=""
}