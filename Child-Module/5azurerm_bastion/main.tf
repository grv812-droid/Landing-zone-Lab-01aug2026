data "azurerm_subnet" "data-subnet" {
  for_each = var.c-data-subnet
  name = each.key
  virtual_network_name = each.value.vir_net_name
  resource_group_name = each.value.rgname
}


data "azurerm_public_ip" "pubip" {
  for_each = var.c-data-pubip
  name = each.key
  resource_group_name = each.value.rgname
}

resource "azurerm_bastion_host" "apex-bastion" {
    for_each = var.c-bastion
    name = each.key
    resource_group_name = each.value.rgname
    location = each.value.location
    ip_configuration {
      name = each.value.ipconfig
      subnet_id = data.azurerm_subnet.data-subnet[each.value.subnet_name].id
      public_ip_address_id = data.azurerm_public_ip.pubip[each.value.pubip].id
      
    }
}
  