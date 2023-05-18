locals {
  env = substr("${terraform.workspace}", 24, -1)
}

resource "azurerm_resource_group" "rg" {
  name     = "example-resource-group-${local.env}"
  location = "jap-east"
}