variable vm_config {
  description = "A map of virtual machine configurations."
  type = map(object({
    name                  = string
    resource_group_name   = string
    location              = string
    size                  = string
    admin_username        = string
    admin_password        = string
    network_interface_id_key = string
     disable_password_authentication = bool
    os_disk               = object({
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

variable "nic_ids" {
  description = "A map of network interface IDs."
  type = map(string)
}

variable "location" {
  type = string
}