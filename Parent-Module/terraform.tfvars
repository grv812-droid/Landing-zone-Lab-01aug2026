p-rgs = {
  rg-dev = {
    location  = "japan east"
    managedby = "vishvendra ji"
  }
  rg-qa = {
    location  = "japan east"
    managedby = "ranjan ji"
  }

  rg-prod = {
    location  = "japan east"
    managedby = "saurav ji"
  }
}

p-vnet = {
  vnet-dev = {
    location = "japan east"
    rgname   = "rg-dev"
    addspace = ["10.0.0.0/16"]
  }
}

p-subnet = {

  subnet1-apex = {
    rgname       = "rg-dev"
    vir_net_name = "vnet-dev"
    addpre       = ["10.0.0.64/26"]
  }

  subnet2-apex = {
    rgname       = "rg-dev"
    vir_net_name = "vnet-dev"
    addpre       = ["10.0.0.128/26"]
  }

  AzureBastionSubnet = {
    rgname       = "rg-dev"
    vir_net_name = "vnet-dev"
    addpre       = ["10.0.0.192/26"]
  }
}

p-pubips = {
  bastion_ip = {
    rgname            = "rg-dev"
    location          = "japan east"
    allocation_method = "Static"
  }
}

p-bastion = {
  bastion_for_apex = {
    rgname      = "rg-dev"
    location    = "japan east"
    ipconfig    = "ipconfigforbastion"
    subnet_name = "AzureBastionSubnet"
    pubip       = "bastion_ip"
  }
}

p-vms = {
  vm-nic-frontend={
    location="japan east"
    rgname="rg-dev"
    ipconfigname="frontend"
    subnet_id="subnet1-apex"
    add_allo="Dynamic"

    vmname="vm-frontend"
    size="Standard_L2aos_v4"
    usrname="grv812"
    pswd="Amaira310790"
    auth="false"
    stg_type="Standard_LRS"
    cache="ReadWrite"
    publisher="Canonical"
    offer ="ubuntu-24_04-lts"
    sku="server"
    version="latest"
  }

  vm-nic-backend={
    location="japan east"
    rgname="rg-dev"
    ipconfigname="backend"
    subnet_id="subnet2-apex"
    add_allo="Dynamic"

    vmname="vm-backend"
    size="Standard_L2aos_v4"
    usrname="grv812"
    pswd="Amaira310790"
    auth="false"
    stg_type="Standard_LRS"
    cache="ReadWrite"
    publisher="Canonical"
    offer ="ubuntu-24_04-lts"
    sku="server"
    version="latest"
    
  }

}