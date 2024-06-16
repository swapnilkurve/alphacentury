resource "azurerm_storage_account" "StorageAccount" {
  for_each                 = var.SA
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

}
resource "azurerm_storage_container" "container" {
  for_each = var.SA
  name                  = "backendtfstate"
  storage_account_name  = azurerm_storage_account.StorageAccount[each.key].name
  container_access_type = "private"
}

