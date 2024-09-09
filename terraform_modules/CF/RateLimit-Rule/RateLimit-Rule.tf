provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "examples-rg"
  location = "West Europe"

  # NIST Compliance Tags
  tags = {
    avm_git_commit           = "3077cc6d0b70e29b6e106b3ab98cee6740c916f6"
    avm_git_file             = "main.tf"
    avm_git_last_modified_at = "2023-05-05 08:57:54"
    avm_git_org              = "lonegunmanb"
    avm_git_repo             = "terraform-yor-tag-test-module"
    avm_yor_trace            = "a0425718-c57d-401c-a7d5-f3d88b2551a4"
  }
}

module "postgresql" {
  source = "Azure/postgresql/azurerm"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  server_name                   = "examples-server"
  sku_name                      = "GP_Gen5_2"
  storage_mb                    = 5120
  auto_grow_enabled             = false
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  administrator_login           = "login"
  administrator_password        = "password"
  server_version                = "9.5"
  ssl_enforcement_enabled       = true
  public_network_access_enabled = true
  db_names                      = ["my_db1", "my_db2"]
  db_charset                    = "UTF8"
  db_collation                  = "English_United States.1252"

  firewall_rule_prefix = "firewall-"
  firewall_rules = [
    { name = "test1", start_ip = "10.0.0.5", end_ip = "10.0.0.8" },
    { start_ip = "127.0.0.0", end_ip = "127.0.1.0" },
  ]

  vnet_rule_name_prefix = "postgresql-vnet-rule-"
  vnet_rules = [
    { name = "subnet1", subnet_id = "<subnet_id>" }
  ]

  # NIST Compliance Tags
  tags = {
    avm_git_commit           = "3077cc6d0b70e29b6e106b3ab98cee6740c916f6"
    avm_git_file             = "main.tf"
    avm_git_last_modified_at = "2023-05-05 08:57:54"
    avm_git_org              = "lonegunmanb"
    avm_git_repo             = "terraform-yor-tag-test-module"
    avm_yor_trace            = "a0425718-c57d-401c-a7d5-f3d88b2551a4"
  }

  postgresql_configurations = {
    backslash_quote = "on",
  }

  depends_on = [azurerm_resource_group.example]
}
