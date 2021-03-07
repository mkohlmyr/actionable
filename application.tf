terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

locals {
  service_name = "forum"
  owner        = "Community Team"
}