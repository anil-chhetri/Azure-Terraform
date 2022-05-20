# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    ## configure options
    subscription_id = "c2eed73e-337b-4549-a859-4e290835acf3"
    client_id = "0f43de6d-13e0-4a5e-9a32-e10fa367e667"
    tenant_id = "7680316a-5e9e-4cc5-a52e-9ee89ee8c404"
    client_secret = "NLx8Q~du46lZSq15xOuSj3oXoufXexlYNnP.-db2"

  features {}
}

resource "azurerm_resource_group" "app_grp" {
    name = "app_grp_anil_0010c"
    location = "Central India"
  
}
