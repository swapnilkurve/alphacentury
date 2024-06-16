
resource "azurerm_key_vault_secret" "KVSecret" {
  for_each     = var.KeyvaultSecret
  name         = each.value.secretname
  value        = each.value.secretvalue
  key_vault_id = data.azurerm_key_vault.keyvault.id
}