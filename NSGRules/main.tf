data "azurerm_network_security_group" "nsg_data" {
  for_each            = var.nsgrule
  name                = each.value.network_security_group_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_security_rule" "nsg_rules" {
  for_each                    = var.nsgrule
  name                        = each.value.nsg_rules_name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = data.azurerm_network_security_group.nsg_data[each.key].resource_group_name
  network_security_group_name = data.azurerm_network_security_group.nsg_data[each.key].name
}