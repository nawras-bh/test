#!/bin/bash
#Connect and set Subscription Context in Azure
az login --service-principal -u 59b8cb25-2ee5-4122-ad33-7214807b7081 -p 8HfrLiUlF6qW8Ak1kWe9m~wk0Y9Pozd-0b --tenant b3ad2679-9a3b-41ed-a05b-03cfd9a4d4b6



#Set Variables for Storage account and Key Vault that support the Terraform implementation
RESOURCE_GROUP_NAME=remotestate-rg
STORAGE_ACCOUNT_NAME=stotagestate
CONTAINER_NAME=remotestate
STATE_FILE="terraform.state"

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location uksouth

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key and store it as an environment variable
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

# Show details 
echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"
echo "state_file: $STATE_FILE"

#
