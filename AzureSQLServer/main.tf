resource "azurerm_sql_server" "SQLServer" {
  for_each                     = var.sqlserver
  name                         = each.value.servername
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.UsernameTF.value
  administrator_login_password = data.azurerm_key_vault_secret.PasswordTF.value
}
