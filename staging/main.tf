terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.25.0"
    }
  }
  cloud {
    organization = "tmaeda-hashicorp"
    hostname     = "app.terraform.io"

    workspaces {
      name = "terraformcloud-azure-demo-github"
    }
  }
}

# general credentials setting
provider "azurerm" {
  features {}
  #  subscription_id = var.subscription_id
  #  tenant_id       = var.tenant_id
  #  client_id       = var.client_id
  #  client_secret   = var.client_secret
}

module "resource_group" {
  source = "./../module/resource_group"
}

module "storage_account" {
  source = "./../module/storage_account"
}

#locals {
#  env = substr("${terraform.workspace}", 26, -1)
#}

#resource "azurerm_resource_group" "example" {
#  name     = "example-resource-group-${local.env}"
#  location = "japaneast"
#}
