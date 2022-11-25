
output "network_interface_ids" {
  description = "ids of the vm nics provisoned."
  value       = azurerm_network_interface.example.*.id
}

output "network_interface_private_ip" {
  description = "private ip addresses of the vm nics"
  value       = azurerm_network_interface.example.*.private_ip_address
}