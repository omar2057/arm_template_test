data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = "${var.prefix}-kv-${var.resources_name}-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = var.sku_name
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Get",
      "Create",
      "List",
      "Delete",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "List",
      "Delete",
    ]
  }
}

resource "azurerm_key_vault_secret" "secret" {
  name         = "${var.prefix}-secret-sa-${var.resources_name}-${var.environment}"
  value        = var.secret_connection_string_sa
  key_vault_id = azurerm_key_vault.kv.id
}