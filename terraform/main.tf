provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket = "actionable-terraform-remote-state"
    key    = "actionable/terraform.tfstate"
    region = "eu-west-2"
  }
}
