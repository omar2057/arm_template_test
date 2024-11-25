# Reto tecnico

This repository have the nessesary files to complete the technical challenge described here [Test_Omar.wiki/350/Reto-Tecnico](https://dev.azure.com/ArroyoTechTesting/Test_Omar/_wiki/wikis/Test_Omar.wiki/350/Reto-Tecnico)

## ARM templates

## Terraform

## log

- download az cli in computer to test and login - az login
```
You have logged in. Now let us find all the subscriptions to which you have access...
[
  {
    "cloudName": "AzureCloud",
    "id": "***",
    "isDefault": true,
    "name": "Azure Trainings New",
    "state": "Enabled",
    "tenantId": "***",
    "user": {
      "name": "DevopsTest.Nov04@***",
      "type": "user"
    }
  }
]
```

- read about RG (resource group) and azure suscriptions.

- find azure suscription - find it [here](https://portal.azure.com/#view/Microsoft_Azure_Billing/SubscriptionsBladeV2)

- Create one resourse group using manually. [OmarLucia-RG](https://portal.azure.com/#@arroyoconsulting.net/resource/subscriptions/a4924200-2523-46cf-a092-0479ad3fe852/resourceGroups/OmarLucia-RG/overview)

- read about arm templates

- Basic template for azure storage account: [template](https://github.com/Azure/azure-quickstart-templates/blob/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json) - modifying to use multienv

- issues with az deployment group, az cli have not recent version, 2.2 at least need it

- create ARM templates for Storage Account and KeyVult

- Create script to get ConnectionsString and set new secret

- Deploy resources with ARM templates

- Set new permission to be able to create new secret.

- Run create script.


