data "azurerm_subscription" "primary" {
}

module "azure_role_assignment" {
  source               = "git::https://github.com/BrettOJ/tf-az-module-rbac-role-assignment?ref=main"
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = module.azurerm_user_assigned_identity.msi_output.principal_id
  depends_on = [ module.azurerm_key_vault, module.azurerm_user_assigned_identity ]
}