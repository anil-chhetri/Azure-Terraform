terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "c2eed73e-337b-4549-a859-4e290835acf3"
    client_id = "a7f52333-f167-4199-9ffc-4f81d6088d92"
    tenant_id = "7680316a-5e9e-4cc5-a52e-9ee89ee8c404"
    client_secret = "khB8Q~cYzvMPyuPxpCtKCGxDXj23_4S8yN2Bvabk"
  features {  }
}


resource "azurerm_resource_group" "rg" {
  name = "rgstorageaccount8934"
  location = "Central India"
}


resource "azurerm_storage_account" "storage" {
  name = "stgterraformtest982340"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
  account_replication_type = "LRS"
}