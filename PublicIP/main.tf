resource "azurerm_public_ip" "pip" {
  for_each            = var.Public_ip
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = each.value.sku
}

