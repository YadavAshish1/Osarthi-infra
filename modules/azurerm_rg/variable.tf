variable "rgs" {
  type = map(object({
    name = string
  }))
}

variable "location" {
  type = string
}