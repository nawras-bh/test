terraform {
  backend "azurerm" {
    resource_group_name  = "remotestate-rg"
    storage_account_name = "stotagestate"
    container_name       = "remotestate"
    key                  = "terraform.tfstate"
  }

}

