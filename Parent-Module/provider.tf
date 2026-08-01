terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>5.0.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-backend-apex"
    storage_account_name = "backenddriveapex1122"
    container_name       = "backend-container"
    key                  = "apex.statefile"
  }
}

provider "azurerm" {
  features {

  }
}

