module "bucket" {
  source = "./modules/services/bucket"
  bucketname = "auto-expiring-bucket-123654788"
  location = "US"
  lifecycleruleage = 3
}

