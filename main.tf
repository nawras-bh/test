module "storage" {
  source   = "./modules/storage"
  location = "eastus"
  rgname   = "iotstorage1"
  saname   = "edgepfe"

}

