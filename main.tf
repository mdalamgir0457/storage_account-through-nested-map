resource "azurerm_resource_group" "rg_alamgir" {
    for_each = var.rg_alamgir
    name = each.key
    location =each.value
  
}

resource "azurerm_storage_account" "storage_account" {
for_each = var.storage_account 
name = each.value.name
resource_group_name = azurerm_resource_group.rg_alamgir[each.value.rg_name].name
location = each.value.location
account_tier = each.value.account_tier
account_replication_type = each.value.account_replication_type
}
resource "azurerm_storage_container" "container1" {
    for_each = var.container1
  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.storage_account[each.value.storage_account].name
  container_access_type = each.value.container_access_type
}