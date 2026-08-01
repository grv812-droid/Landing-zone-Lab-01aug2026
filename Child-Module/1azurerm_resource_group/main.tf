resource "azurerm_resource_group" "rg-apex" {
  for_each = var.c-rgs
  name = each.key
  location = each.value.location
  managed_by = each.value.managedby
}