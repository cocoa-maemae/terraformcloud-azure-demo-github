locals {
  env = substr("${terraform.workspace}", 24, -1)
}

resource "azurerm_resource_group" "example" {
  name     = "example-resource-group-${local.env}"
  location = "japaneast"
}