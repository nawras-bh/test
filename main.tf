terraform {
  backend "azurerm" {
    resource_group_name  = "remotestate-rg"
    storage_account_name = "nawrasstate"
    container_name       = "remotestate"
    key                  = "/mCJ9nxIVGx9Qqm3+RF9GlVlqvUBfV+hFKb/rF2fodc2/YPtOO9LW7XJet3r5+p54E9ATeKebReIVKIgg1fvmg=="
  }
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
