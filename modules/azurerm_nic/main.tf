resource "azurerm_network_interface" "nic" {
  for_each            = var.nic_config
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = var.location
  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = var.subnet_ids[each.value.subnet_key]
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = each.value.ip_configuration.public_ip_address_id
  }
}