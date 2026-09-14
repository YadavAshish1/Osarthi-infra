variable "resource_groups" {
  description = "A map of resource group configurations for UAT environment."
  type = map(object({
    name = string
  }))
}

variable "vnets" {
  description = "A map of virtual network configurations for UAT environment."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  description = "A map of subnet configurations for UAT environment."
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "nics" {
  description = "A map of network interface configurations for UAT environment."
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    subnet_key          = string
    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
      public_ip_address_id          = optional(string)
    })
  }))
}

variable "vms" {
  description = "A map of virtual machine configurations for UAT environment."
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = string
    size                            = string
    admin_username                  = string
    admin_password                  = string
    network_interface_id_key        = string
    disable_password_authentication = bool
    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}