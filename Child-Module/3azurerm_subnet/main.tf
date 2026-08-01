resource "azurerm_subnet" "subnet-apex" {
    for_each = var.c-subnet
name = each.key
resource_group_name = each.value.rgname
virtual_network_name = each.value.vir_net_name
address_prefixes = each.value.addpre
}
