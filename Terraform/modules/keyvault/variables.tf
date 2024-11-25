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
  default = "terraform"
}

variable "resources_name" {
  description = "name for all terraform resources"
  type        = string
  default = "omarlucia"
}

# Environment variables
variable "environment" {
  description = "Environment name"
  type        = string
}


# KeyVault variables
variable "sku_name" {
  
}

variable "secret_connection_string_sa" {
  
}

variable "object_id" {
  
}