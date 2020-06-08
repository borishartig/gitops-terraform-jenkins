# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
  use_msi = true
  subscription_id = "25d0e3e3-75da-4395-a34a-9250d6cf1b28"
  tenant_id = "b41b5fb4-7480-4d7d-9735-07cd73bfd2f3"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "RG-BORIS"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "VN-BORIS"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["100.64.0.0/16"]
}
