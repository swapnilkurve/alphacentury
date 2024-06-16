resource "azurerm_network_security_group" "nsg" {
  for_each            = var.linuxvm
  name                = each.value.nsgname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.linuxvm
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  for_each                  = var.linuxvm
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_linux_virtual_machine" "example" {
  for_each                        = var.linuxvm
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.UsernameTF.value
  admin_password                  = data.azurerm_key_vault_secret.PasswordTF.value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}