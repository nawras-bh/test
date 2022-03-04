
resource "azurerm_resource_group" "iotstorage" {
  name     = var.rgname
  location = var.location
}
resource "azurerm_storage_account" "edgepfe" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.iotstorage.name
  location                 = azurerm_resource_group.iotstorage.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "edgeblob" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.edgepfe.name
  container_access_type = "private"
}
