data "azurerm_key_vault" "keyvault" {
  name                = "mehulmoduleKV"
  resource_group_name = "Mehul_RG"
}