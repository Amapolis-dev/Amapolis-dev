#!/bin/bash

SUBSCRIPTION_ID=${1:-"133541e5-74f7-443e-9608-b5a6bf7e575e"}
LOCATION=${2:-"westeurope"}
RESOURCE_GROUP_NAME="amapolis-dot-dev-terraform-resource-group"
STORAGE_ACCOUNT_NAME=${3:-"amapolisterraformstorage"} # The same storage account can only exist once
CONTAINER_NAME="terraform-state"

# Set target subr
az account set --subscription $SUBSCRIPTION_ID

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location ${LOCATION}

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
