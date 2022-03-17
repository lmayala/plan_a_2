variable "region" {default="us-east-2"}
variable "main_vpc_cidr" { default = "10.0.0.0/16"}
variable "public_subnet1" { default = "10.0.1.0/24"}
variable "public_subnet2" { default = "10.0.2.0/24"}
variable "private_subnet1" { default = "10.0.3.0/24"}
variable "private_subnet2" { default = "10.0.4.0/24"}

provider "aws" {
  region                      = var.region
  access_key                  = "fake"
  secret_key                  = "fake"
  skip_credentials_validation = true
#  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3 = "http://localhost:4566"
    eks = "http://localhost:4566"
    ecs = "http://localhost:4566"
    kms = "http://localhost:4566"
    iam = "http://localhost:4566"
    ses = "http://localhost:4566"
    sts = "http://localhost:4566"
    sqs = "http://localhost:4566"
  }
}

locals {
  cluster_name = "PlanA-cluster"
  vpc_name    = "Main"
}

data "aws_availability_zones" "available" {}

