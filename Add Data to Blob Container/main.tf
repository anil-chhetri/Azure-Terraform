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


locals {
  location = "Central India"
}

variable "rgname" {
  type = string
  description = "enter the unique name of the resource group"
  default = "rgterraformanil00123"
}


resource "azurerm_resource_group" "rg" {
  name = var.rgname
  location = local.location
}


resource "azurerm_storage_account" "storage" {
  name = "stgazureterraformtest"
  resource_group_name = azurerm_resource_group.rg.name
  location = local.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  depends_on = [
      azurerm_resource_group.rg
  ]
}


resource "azurerm_storage_container" "container" {
  name = "blobterraformanil00"
  storage_account_name = azurerm_storage_account.storage.name
  container_access_type = "blob"
  depends_on = [
      azurerm_storage_account.storage
  ]
}


resource "azurerm_storage_blob" "blob" {
  name = "blobterraformtest001.txt"
  storage_account_name = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.container.name
  type = "Block"
  source = "sample.txt"
  depends_on = [
      azurerm_storage_container.container
  ]
}


# rgterraformanil00123