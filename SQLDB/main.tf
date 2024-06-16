resource "azurerm_sql_database" "example" {
  for_each            = var.SQLDB
  name                = each.value.DBname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  server_name         = each.value.servername

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
