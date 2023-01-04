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

