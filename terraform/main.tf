provider "azurerm" {
    features = {}
}

module "aci" {
    source                   = "./modules/aci"
    resource_group_name      = "myResourceeGroup"
    location                 = "West Europe"
    acr_name                 = "mycontaineregistry"
    container_group_name     = "mycontainergroup"
    api_container_image_tag  = "latest"

}

output "api_url" {
    value = module.aci.api_url
}