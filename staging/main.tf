terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
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

#module "resource_group" {
#  source = "./../module/resource_group"
#}

locals {
  env = substr("${terraform.workspace}", 26, -1)
}

resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group-${local.env}"
  location = "japaneast"
}
