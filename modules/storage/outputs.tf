output "resource_group_name" {
  value = azurerm_resource_group.iotstorage.name
}
output "storage_account_name" {
  value = azurerm_storage_account.edgepfe.name
}

output "storage_container_name" {
  value = azurerm_storage_container.edgeblob.name
}
