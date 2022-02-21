module "storage" {
  source   = "./modules/storage"
  location = "eastus"
  rgname   = "iotstorage"
  saname   = "edgepfe"

}

