data "azurerm_subnet" "subnet_data" {
  for_each             = var.linuxvm
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
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
