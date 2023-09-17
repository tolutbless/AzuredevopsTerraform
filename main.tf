terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.70.0"
    }
  }
}

provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "azuredevops" {
    name                 = "devopstolu"
    location             = "West Europe"

  
}

resource "azurerm_container_group" "deveopscontainer" {
    name                 = "toluwebcon"
    location             = azurerm_resource_group.azuredevops.location
    resource_group_name  = azurerm_resource_group.azuredevops.name
    ip_address_type      = "Public"
    dns_name_label       = "toludevsproject"
    os_type              = "Linux"
    container{
        name = "azurewebapp"
        image = "tolutbless/my-html-webapp:latest"
         cpu = "1"
         memory ="1"

         ports{
            port = 80
            protocol = "TCP"
         }
    }          
  
}

