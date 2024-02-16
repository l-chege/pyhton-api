variable "resource_group_name" {}
variable "location" {}
variable "acr_name" {}
variable "container_group_name" {}
variable "api_container_image_tag" {}

provider "azurerm" {
    features = {}
}

resource "azurerm_container_group" "aci" {
    name                 = var.container_group_name
    resource_group_name  = var.resource_group_name
    location             = var.location


    container {
        name    = "myapi-container"
        image   = "${azurerm_container_registry.acr.login_server}/your-repo-name:${var.api_container_image_tag}"
        cpu     = "0.5"
        memory  = "1.5"
    }

    os_type     = "Linux"
    dns_name_label = "myapideployment"
}

output "api_url" {
    value = azurerm_container_group.aci.ip_address
}