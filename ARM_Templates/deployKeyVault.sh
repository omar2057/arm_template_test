#!/bin/bash

# Usage: ./deployKeyVault.sh <environment> <KeyVault_name> 

# Fixed Resource Group
RESOURCE_GROUP="OmarLucia-RG"

# Parameters from user input
ENVIRONMENT=$1 # Default to 'dev'
KEYVAULT_NAME=$2 # Default Key Vault name
LOCATION="EastUS" # Default to 'EastUS'
SKU="Standard" # Default SKU

# Validate environment
if [[ ! "$ENVIRONMENT" =~ ^(dev|test|prod)$ ]]; then
    echo "Error: Invalid environment. Allowed values are 'dev', 'test', or 'prod'."
    exit 1
fi

# Validate Key Vault name
if [[ -z "$KEYVAULT_NAME" ]]; then
    echo "Error: Key Vault name is required."
    echo "Usage: ./deployKeyVault.sh <environment> <KeyVault_name> "
    exit 1
fi


# Construct the full Key Vault name
FULL_KEYVAULT_NAME="${KEYVAULT_NAME}-${ENVIRONMENT}"

# Check if Key Vault already exists
echo "Checking if Key Vault '$FULL_KEYVAULT_NAME' exists in resource group '$RESOURCE_GROUP'..."
EXISTING_KEYVAULT=$(az keyvault show --name "$FULL_KEYVAULT_NAME" --resource-group "$RESOURCE_GROUP" --query "name" -o tsv 2>/dev/null)

if [[ -n "$EXISTING_KEYVAULT" ]]; then
    echo "Key Vault '$FULL_KEYVAULT_NAME' already exists. Passing existing Key Vault to the ARM template."
else
    echo "Key Vault '$FULL_KEYVAULT_NAME' does not exist. Proceeding with deployment to create it."
fi

# Deployment command
echo "Starting Key Vault deployment..."
echo "Environment: $ENVIRONMENT"
echo "Location: $LOCATION"
echo "Key Vault Name: $KEYVAULT_NAME"
echo "SKU: $SKU"
echo "Resource Group: $RESOURCE_GROUP"

az deployment group create \
    --resource-group "$RESOURCE_GROUP" \
    --template-file "KeyVault.json" \
    --parameters environment="$ENVIRONMENT" location="$LOCATION" keyVaultName="$KEYVAULT_NAME" sku="$SKU"

if [ $? -eq 0 ]; then
    echo "Key Vault deployment successful!"
else
    echo "Key Vault deployment failed."
    exit 1
fi