data "azurerm_subnet" "data-subnet" {
  for_each = var.c-data-subnet
  name = each.key
  virtual_network_name = each.value.vir_net_name
  resource_group_name = each.value.rgname
}
resource "azurerm_network_interface" "apex-vm-nic" {
  for_each = var.c-vms
  name = each.key
  location = each.value.location
  resource_group_name = each.value.rgname
  ip_configuration {
    name = each.value.ipconfigname
    subnet_id = data.azurerm_subnet.data-subnet[each.value.subnet_id].id
    private_ip_address_allocation = each.value.add_allo
  }
}

resource "azurerm_linux_virtual_machine" "fronted-vm-apex" {
    for_each = var.c-vms
    name = each.value.vmname
    location = each.value.location
    resource_group_name = each.value.rgname
    network_interface_ids = [azurerm_network_interface.apex-vm-nic[each.key].id]
    size = each.value.size
    admin_username = each.value.usrname
    admin_password = each.value.pswd
    disable_password_authentication = each.value.auth
    
    os_disk {
      storage_account_type = each.value.stg_type
      caching = each.value.cache
    }
      source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}