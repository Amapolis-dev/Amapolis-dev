terraform {
  required_version = ">= v1.0.3"

  # Define which provider is used
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.70.0"
    }
  }

  # Define where the the terraform state should be held
  backend "azurerm" {
    resource_group_name  = "amapolis-dot-dev-terraform-resource-group"
    storage_account_name = "amapolisterraformstorage" # This needs to be replaced when deploying somewhere new. Unfortunately we can't move this into a variable (https://github.com/hashicorp/terraform/issues/13022)
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}

# Configure the provider / where the resources should be deployed to
provider "azurerm" {
  features {
  }
  subscription_id   = var.subscription_id
}

resource "azurerm_subscription" "amapolis_root_subscription" {
  subscription_name = var.subscription_name
  subscription_id   = var.subscription_id
}

resource "azurerm_resource_group" "amapolis_dot_dev_resource_group" {
  name     = "amapolis-dot-dev-resource-group"
  location = var.datacenter_location
}

resource "azurerm_static_site" "amapolis_dot_dev_web_app" {
  name                = "amapolis-dot-dev-web-app"
  resource_group_name = azurerm_resource_group.amapolis_dot_dev_resource_group.name
  location            = azurerm_resource_group.amapolis_dot_dev_resource_group.location
}
