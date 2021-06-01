module "bucket" {
  source = "./modules/services/bucket"
  bucketname = "auto-expiring-bucket-123654788"
  location = "US"
  lifecycleruleage = 3
}

module "cluster" {
  source = "./modules/services/cluster"
  clustername = "my-gke-cluster"
  location = "us-west1"
  nodecount = 1
  nodepoolname = "my-node-pool"
  machinetype = "e2-micro"
}