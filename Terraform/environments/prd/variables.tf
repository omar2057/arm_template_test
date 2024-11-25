# global variables
variable "resource_group" {
    description = "Resource group for my technical challenge"
    type = string
    default = "OmarLucia-RG"
}

variable "location" {
    description = "Resources location"
    type = string
    default = "eastus"
  
}

variable "prefix" {
  description = "Prefix for all terraform resources"
  type        = string
  default = "tf"
}

variable "resources_name" {
  description = "Storage account name"
  type        = string
  default = "omarlucia"
}

# Environment variables
variable "environment" {
  description = "Environment name"
  type        = string
}

## Storage account variables
variable "account_tier" {
  
}
variable "account_replication_type" {
  
}

## KeyVault variables
variable "sku_name" {
  
}

variable "object_id" {
  description = "The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault." # Need to change
  type = string
  
}