locals {
  env = substr("${terraform.workspace}", 26, -1)
}

resource "azurerm_resource_group" "example" {
  name     = "example-resource-group-${local.env}"
  location = "japaneast"
}