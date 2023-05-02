terraform {
  backend "azurerm" {
    resource_group_name  = "git-actions-rg"
    storage_account_name = "gitactionstate"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  resource_group_name   = var.rgname     #B
  location = var.location
}
module "SA" {
  source   = "./modules/StorageAccount"
  sname    = var.sname
  resource_group_name   = module.RG.resourcegroup_name
  location = var.location
}