module "bucket" {
  source = "./modules/services/bucket"
  bucketname = "auto-expiring-bucket-123654788"
  location = var.location
  lifecycleruleage = 3
}

module "cluster" {
  source = "./modules/services/cluster"
  clustername = "my-gke-cluster"
  location = var.region
  nodecount = 1
  nodepoolname = "my-node-pool"
  machinetype = var.machinetype
}

module "iam" {
  source = "./modules/services/iam"
  project = var.project_name
}