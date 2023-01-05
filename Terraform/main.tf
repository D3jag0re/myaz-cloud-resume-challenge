terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.37.0"
    }
  }
}

# Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "prod" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.prod.name
  location                 = azurerm_resource_group.prod.location
  account_kind = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true 
  
  static_website {
    index_document = "index.html"
    #error_404_document = "404.html"
  }

  tags = {
    environment = "production"
  }
}




