resource "azurerm_public_ip" "pub-ip" {
    for_each = var.c-pubips
    name = each.key
    resource_group_name = each.value.rgname
    location = each.value.location
    allocation_method = each.value.allocation_method
  
}
