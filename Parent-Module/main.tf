module "rg-cretion" {
  source = "../Child-Module/1azurerm_resource_group"
  c-rgs  = var.p-rgs

}

module "vnet-creation" {
  depends_on = [module.rg-cretion]
  source     = "../Child-Module/2azurerm_virtual_network"
  c-vnet     = var.p-vnet
}
module "subnet-creation" {
  depends_on = [module.rg-cretion, module.vnet-creation]
  source     = "../Child-Module/3azurerm_subnet"
  c-subnet   = var.p-subnet
}

module "pubip-creation" {
  depends_on = [module.rg-cretion]
  source     = "../Child-Module/4azurerm_pub_ip"
  c-pubips   = var.p-pubips
}

module "bastion-creation" {
  depends_on = [module.subnet-creation, module.pubip-creation]
  source     = "../Child-Module/5azurerm_bastion"

  c-data-subnet = var.p-subnet
  c-data-pubip  = var.p-pubips
  c-bastion     = var.p-bastion

}
module "nsg-creation" {
  depends_on = [module.rg-cretion]
  source     = "../Child-Module/7azurerm_nsg"
  c-nsg      = var.p-nsg
}

module "vm-creation" {
  depends_on    = [module.subnet-creation, module.nsg-creation]
  source        = "../Child-Module/6azurerm_virtual_machine"
  c-data-subnet = var.p-subnet
  c-vms         = var.p-vms
  c-nsg         = var.p-nsg

}