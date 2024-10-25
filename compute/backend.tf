terraform {
  backend "azurerm" {
    resource_group_name  = "psychplus-dev"
    storage_account_name = "terraformstatekeeper"
    container_name       = "tfstate"
    key                  = "compute/terraform.tfstate"
  }
}