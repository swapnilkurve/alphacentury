data "azurerm_virtual_network" "vnet_data" {
  name                = "vnet_mehul"
  resource_group_name = "Mehul_RG"
}

data "azurerm_public_ip" "PublicIP_data" {
  name                = "loadbalancerPiP"
  resource_group_name = "Mehul_RG"
}
data "azurerm_virtual_machine" "FrontendVm1" {
  name                = "FrontendVm1"
  resource_group_name = "Mehul_RG"
}
data "azurerm_virtual_machine" "FrontendVm2" {
  name                = "FrontendVm2"
  resource_group_name = "Mehul_RG"
}