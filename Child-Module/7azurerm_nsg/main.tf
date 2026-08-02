resource "azurerm_network_security_group" "nsg-apex" {
  for_each = var.c-nsg
  name = each.key
  location = each.value.location
  resource_group_name = each.value.rgname
  
  security_rule {
    name                       = each.value.ssh.name
    priority                   = each.value.ssh.priority
    direction                  = each.value.ssh.direction
    access                     = each.value.ssh.access
    protocol                   = each.value.ssh.protocol
    source_port_range          = each.value.ssh.source_port_range
    destination_port_range     = each.value.ssh.destination_port_range
    source_address_prefix      = each.value.ssh.source_address_prefix
    destination_address_prefix = each.value.ssh.destination_address_prefix
    }
}
