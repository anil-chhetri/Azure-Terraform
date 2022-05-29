terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
    subscription_id = ""
    client_id = " "
    tenant_id = " "
    client_secret = " k"
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