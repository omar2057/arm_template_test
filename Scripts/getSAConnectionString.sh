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
CONNECTION_STRING_TEXT=$(az storage account show-connection-string \
    --resource-group "$RESOURCE_GROUP" \
    --name "$STORAGE_ACCOUNT_NAME" \
    --query "connectionString" -o tsv)

if [[ -z "$CONNECTION_STRING_TEXT" ]]; then
    echo "Error: Storage Account not found."
    exit 1
fi

echo "##vso[task.setvariable variable=CONNECTION_STRING;]'$CONNECTION_STRING_TEXT'"