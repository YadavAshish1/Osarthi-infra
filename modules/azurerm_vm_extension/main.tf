resource "azurerm_virtual_machine_extension" "nginx" {
  for_each = var.vm_ids

  name                 = "nginx-install"
  virtual_machine_id   = each.value
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = jsonencode({
    commandToExecute = "sudo apt-get update -y && sudo apt-get install -y nginx && sudo systemctl enable nginx && sudo systemctl start nginx"
  })
}