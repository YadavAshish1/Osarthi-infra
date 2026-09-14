variable "nic_config" {
  description = "A map of network interface configurations."
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

variable "subnet_ids" {
  type = map(string)
}

variable "location" {
  type = string
}