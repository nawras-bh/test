terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "iotstorage" {
  name = "iotstorage"
  location = "eastus"
}
resource "azurerm_storage_account" "edgepfe" {
  name                     = "edgepfe"
  resource_group_name      = azurerm_resource_group.iotstorage.name
  location                 = azurerm_resource_group.iotstorage.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "edgeblob" {
  name                  = "edgeblob"
  storage_account_name  = azurerm_storage_account.edgepfe.name
  container_access_type = "private"
}
