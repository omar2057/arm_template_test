# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "storage_account" {
  source = "../../modules/storageaccount"

  resource_group = var.resource_group
  prefix = var.prefix
  environment =  var.environment
  location = var.location
  resources_name = var.resources_name

  account_tier = var.account_tier
  account_replication_type = var.account_replication_type

}

module "kv" {
  source = "../../modules/keyvault"

  resource_group = var.resource_group
  prefix = var.prefix
  environment =  var.environment
  location = var.location
  resources_name = var.resources_name

  sku_name = var.sku_name

  secret_connection_string_sa = module.storage_account.connection_string
  object_id = var.object_id

  depends_on = [ module.storage_account ]
  
}