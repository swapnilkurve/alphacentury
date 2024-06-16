data "azurerm_key_vault" "keyvault" {
  name                = "mehulmoduleKV"
  resource_group_name = "Mehul_RG"
}
data "azurerm_key_vault_secret" "UsernameTF" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}
data "azurerm_key_vault_secret" "PasswordTF" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}