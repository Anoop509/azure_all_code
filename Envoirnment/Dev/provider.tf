terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
  # backend "azurerm" {
  #   # resource_group_name  = "ajay01"
  #   # storage_account_name = "ajaystg04"
  #   # container_name       = "ajaycont"
  #   # key                  = "ajay.tfstate"

  # }
}

provider "azurerm" {
  features {}

  subscription_id = "009fad33-c09c-4841-af38-57dd79870d40"
}
