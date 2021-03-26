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

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "lambda-without-layer"
  description   = "My awesome lambda function"
  handler       = "index.handler"
  runtime       = "nodejs12.x"
  publish       = true

  source_path = "../dist"

  store_on_s3 = true
  s3_bucket   = "my-bucket-with-lambda-builds"

  environment_variables = {
    Serverless = "Terraform"
  }

  tags = {
    Module = "lambda-without-layer"
  }
}