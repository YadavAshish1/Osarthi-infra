
module "rg" {
  source = "../../modules/azurerm_rg"
  rgs = var.resource_groups
  location = local.location
}

module "vnet" {
  source      = "../../modules/azurerm_vnet"
  vnet_config = var.vnets
  location = local.location
  depends_on = [ module.rg ]
}

module "subnet" {
  source        = "../../modules/azurerm_subnet"
  subnet_config = var.subnets
  depends_on = [ module.vnet ]
}

module "nic" {
  source     = "../../modules/azurerm_nic"
  nic_config = var.nics
  subnet_ids = module.subnet.subnet_ids
  location = local.location
  depends_on = [ module.subnet ]
}

module "vm" {
  source    = "../../modules/azurerm_vm"
  vm_config = var.vms
  nic_ids   = module.nic.nic_ids
  location = local.location
  depends_on = [ module.nic ]
}

module "vm_extension" {
  source = "../../modules/azurerm_vm_extension"
  vm_ids = module.vm.vm_ids
  depends_on = [ module.vm ]
}