module "resource_group" {
  source = "./../resource_group"
}

locals {
  env = substr("${terraform.workspace}", 26, -1)
}

resource "azurerm_storage_account" "example" {
  name                     = "teststorage${local.env}"
  resource_group_name      = module.resource_group.resource_group_name
  location                 = "japaneast"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "example"
  }
}
