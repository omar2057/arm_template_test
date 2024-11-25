#!/bin/bash

# Usage: ./getSAConnectionString.sh <storageAccountName> 


# Parameters
RESOURCE_GROUP="OmarLucia-RG" 
STORAGE_ACCOUNT_NAME=$1    

# Validation
if [[ -z "$STORAGE_ACCOUNT_NAME" ]]; then
    echo "Error: Storage Account name required."
    echo "Uso: ./getSAConnectionString.sh <storageAccountName>"
    exit 1
fi

# Getting connection string
echo "Getting Connection String for Storage Account '$STORAGE_ACCOUNT_NAME' in RG '$RESOURCE_GROUP'..."
CONNECTION_STRING=$(az storage account show-connection-string \
    --resource-group "$RESOURCE_GROUP" \
    --name "$STORAGE_ACCOUNT_NAME" \
    --query "connectionString" -o tsv)

if [[ -z "$CONNECTION_STRING" ]]; then
    echo "Error: Storage Account not found."
    exit 1
fi

# Display connection string
echo "Connection String:"
echo "$CONNECTION_STRING"