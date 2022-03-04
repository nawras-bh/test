#  A TF script which provision an Azure Storage Account  and a Blob Container 

> it creates :
> - A new Resource Group
> - A new Storage Account
> - A Blob Container
> - Remote backend 

## Pre-requisites

It is assumed that you have azure CLI and Terraform installed and configured. 

 
 

 ## Usage
 
 Run the following command to initiate Terraform. This would fetch all dependencies needed to execute the Terraform script:
```
 terraform init 
```

Run the following command to creates an execution plan :
```
 terraform plan 
```

Run this command executes the actions proposed in a Terraform plan :
```
 terraform apply 
```
## Remote backend

allows Terraform to store the state file in a remote location  for that we need to separate the Terraform State file off into a centralised location such as an Azure Storage account

 The Terraform configuration should be updated with the details of where to store the state. This is done in the ‘backend’ section below :

```ruby
terraform {  
backend "azurerm" {
    resource_group_name  = "remotestate-rg"
    storage_account_name = "stotagestate"
    container_name       = "remotestate"
    key                  = "terraform.tfstate"
```
       
Note that the storage account needs to be created before Terraform code is applied we will then  a bash script for this.

The first step to do  is create our storage account and container that will store our Terraform State File as follows by running the following Bash script:

 ```ruby
 
 #!/bin/bash
#Connect to azure account first
az login
#Set Variables for Storage account and Key Vault 
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

# visualize variables
echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"
echo "state_file: $STATE_FILE"
#
 
   ``` 

## Clean resources

Destroy everything that was created

```
 terraform destroy --force
```

## Caution

Be aware that by running this script your account might get billed.

