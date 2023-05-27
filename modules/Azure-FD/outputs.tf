output "frontdoor_name" {
  description = "The name of the FrontDoor"
  value       = azurerm_frontdoor.example.name
}

output "frontdoor_cname" {
  description = "The host that each frontendEndpoint must CNAME to"
  value       = azurerm_frontdoor.example.cname
}

output "frontdoor_id" {
  description = "The ID of the FrontDoor."
  value       = azurerm_frontdoor.example.id
}