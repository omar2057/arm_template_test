#!/bin/bash

# Usage: ./deployStorageAccount.sh <environment> <storage_name> 


RESOURCE_GROUP="OmarLucia-RG"

# Parameters
ENVIRONMENT=$1 # Environment
SANAME=$2 # Name of Storage account
LOCATION="EastUS" # Default to 'EastUS'
SKU="Standard_LRS" # Default to 'Standard_LRS'

# Validate environment
if [[ ! "$ENVIRONMENT" =~ ^(dev|test|prod)$ ]]; then
    echo "Error: Invalid environment. Allowed values are 'dev', 'test', or 'prod'."
    exit 1
fi

# Validate Storage Account name
if [[ -z "$SANAME" ]]; then
    echo "Error: Storage Account name is required."
    echo "Usage: ./deployStorageAccount.sh <environment> <storage_name> "
    exit 1
fi

# Deployment command
echo "Starting deployment..."
echo "Storage Account Name: $SANAME"
echo "Environment: $ENVIRONMENT"
echo "Location: $LOCATION"
echo "SKU: $SKU"
echo "Resource Group: $RESOURCE_GROUP"

az deployment group create \
    --resource-group "$RESOURCE_GROUP" \
    --template-file "StorageAccount.json" \
    --parameters environment="$ENVIRONMENT" location="$LOCATION" storageAccountName="$SANAME"

if [ $? -eq 0 ]; then
    echo "Deployment successful!"
else
    echo "Deployment failed."
    exit 1
fi
