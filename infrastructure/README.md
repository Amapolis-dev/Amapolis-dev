# Grading Tool Infrastructure

## Prerequisites

For this script you require the **Azure Cli** and be logged in with an account that has admin permission over the target subscription. Use the following command to log into your Azure Cli:

```bash
$ az login
```

## First Time Enviroment Setup

For the very first setup you need to create a remote state on Azure.

Important! This is only needed once for your entire Team! You all share one Terraform state. It's very likely that you don't have to create a new remote state!

To create the storage account execute the following command:

```bash
$ create-terraform-remote-state.sh {AZURE_SUBSCRIPTION_ID} {AZURE_DATACENTER_LOCATION} {AZURE_STORAGE_ACCOUNT_NAME}

Example (with default values):
$ create-terraform-remote-state.sh "133541e5-74f7-443e-9608-b5a6bf7e575e" "westeurope" "amapolisterraformstorage"
```

## Create/Update Enviroment

To initialize the terraform script run the following command. You'll only have to do this once.

```bash
$ terraform init
```

This Terraform script requires an existing Azure subscription to deploy resources to. You can define the subscription as parameter when running the terraform script or change it in the `variable.tf` file.

Use the following command to see changes that would terraform would make.

```bash
$ terraform plan
```

To apply the above changes to the infrastructure use the following command:

```bash
$ terraform apply
```
