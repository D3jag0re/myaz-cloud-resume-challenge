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

# Configure resource group for static site hosting (storage, CDN)

resource "azurerm_resource_group" "prod" {
  name     = var.rgname
  location = var.location
}

# Configure storage account and enable it to host a static website

resource "azurerm_storage_account" "prod" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.prod.name
  location                 = azurerm_resource_group.prod.location
  account_kind = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true 
  
  static_website {
    index_document = "resumecontent.html"
    #error_404_document = "404.html"
  }

  tags = {
    environment = "production"
  }
}

# Configure Azure CDN for use with custom domain and enforcing HTTPS 

resource "azurerm_cdn_profile" "prod" {
  name                = "CR-CDNProfile"
  location            = azurerm_resource_group.prod.location
  resource_group_name = azurerm_resource_group.prod.name
  sku                 = "Standard_Microsoft"

  tags = {
    environment = "production"
  }
}

resource "azurerm_cdn_endpoint" "prod" {
  name                = "CR-CDNEndpoint"
  profile_name        = azurerm_cdn_profile.prod.name
  location            = azurerm_resource_group.prod.location
  resource_group_name = azurerm_resource_group.prod.name

  origin {
    name      = "origin"
    host_name = var.origin
    origin_host_header = var.origin
  }

# Adding rules to force and redirect HTTPS

  delivery_rule {
      name  = "EnforceHTTPS"
      order = "1"

      request_scheme_condition {
        operator     = "Equal"
        match_values = ["HTTP"]
      }

      url_redirect_action {
        redirect_type = "Found"
        protocol      = "Https"
      }
    }
}

# Configure custom domain 

resource "azurerm_cdn_endpoint_custom_domain" "example" {
  name            = "example-domain"
  cdn_endpoint_id = azurerm_cdn_endpoint.prod.id
  host_name       = var.domain
}


### Week 2 ### 

# Configure Resource Group for API

resource "azurerm_resource_group" "prodAPI" {
  name     = var.rgnameAPI
  location = var.location
}

# Configure App Service Plan (Consumption Serverless)

resource "azurerm_service_plan" "prodSP" {
  name                = "example-app-service-plan"
  resource_group_name = azurerm_resource_group.prodAPI.name
  location            = azurerm_resource_group.prodAPI.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "pythonfa" {
  name                = var.faname
  resource_group_name = azurerm_resource_group.prodAPI.name
  location            = azurerm_resource_group.prodAPI.location

  storage_account_name       = azurerm_storage_account.prod.name
  storage_account_access_key = azurerm_storage_account.prod.primary_connection_string
  service_plan_id            = azurerm_service_plan.prodSP.id

  site_config {
    application_stack {
      python_version = 3.9
    }
  }
}