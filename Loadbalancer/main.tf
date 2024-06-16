resource "azurerm_lb" "loadbalancer" {
  name                = "FrontendLB"
  location            = "East US"
  resource_group_name = "Mehul_RG"
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "LoadbalancerIPAddress"
    public_ip_address_id = data.azurerm_public_ip.PublicIP_data.id
  }
}
resource "azurerm_lb_backend_address_pool" "BackendAddressPool" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "BackEndPool"
}
resource "azurerm_lb_backend_address_pool_address" "FrontendBP1" {
  name                    = "FrontendBP1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.BackendAddressPool.id
  virtual_network_id      = data.azurerm_virtual_network.vnet_data.id
  ip_address              = data.azurerm_virtual_machine.FrontendVm1.private_ip_address
}
resource "azurerm_lb_backend_address_pool_address" "FrontendBP2" {
  name                    = "FrontendBP2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.BackendAddressPool.id
  virtual_network_id      = data.azurerm_virtual_network.vnet_data.id
  ip_address              = data.azurerm_virtual_machine.FrontendVm2.private_ip_address
}
resource "azurerm_lb_probe" "LB_Probe" {
  loadbalancer_id = azurerm_lb.loadbalancer.id
  name            = "LB_Health_probe"
  port            = 80
  interval_in_seconds = 5

}
resource "azurerm_lb_rule" "LB_Rule" {
  loadbalancer_id                = azurerm_lb.loadbalancer.id
  name                           = "FrontendLBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LoadbalancerIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.BackendAddressPool.id]
  probe_id = azurerm_lb_probe.LB_Probe.id
}
