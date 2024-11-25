#!/bin/bash

# Usage: createSecret.sh <keyVaultName> <secretName> <connectionString>

# Parameters
KEYVAULT_NAME="$1"
SECRET_NAME="$2"
CONNECTION_STRING="$3"

# Validation
if [[ -z "$KEYVAULT_NAME" || -z "$SECRET_NAME" || -z "$CONNECTION_STRING" ]]; then
  echo "Missing parameters. Usage: $0 <keyVaultName> <secretName> <connectionString>"
  exit 1
fi

# Creating Secret
az keyvault secret set \
    --vault-name "$KEYVAULT_NAME" \
    --name "$SECRET_NAME" \
    --value "$CONNECTION_STRING"


if [ $? -eq 0 ]; then
    echo "Secret '$SECRET_NAME' succesfully created in '$KEYVAULT_NAME'."
else
    echo "Error: Secret not created."
    exit 1
fi