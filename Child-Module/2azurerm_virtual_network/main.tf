resource "azurerm_virtual_network" "vnet-apex" {
  for_each = var.c-vnet
  name = each.key
  location = each.value.location
  resource_group_name = each.value.rgname
  address_space = each.value.addspace
}
