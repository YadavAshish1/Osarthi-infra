resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet_config
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = var.location
  address_space       = each.value.address_space

}