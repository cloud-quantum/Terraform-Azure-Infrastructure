data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name  = "psychplus-dev"
    storage_account_name = "terraformstatekeeper"
    container_name       = "tfstate"
    key                  = "network/terraform.tfstateenv:${terraform.workspace}"
  }
}

data "terraform_remote_state" "storage" {
  backend = "azurerm"
  config = {
    resource_group_name  = "psychplus-dev"
    storage_account_name = "terraformstatekeeper"
    container_name       = "tfstate"
    key                  = "storage/terraform.tfstateenv:${terraform.workspace}"
  }
}