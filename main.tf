# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.0.0"
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
