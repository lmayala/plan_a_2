variable "region" {default="us-east-2"}
variable "vpc_cidr" { default = "10.0.0.0/16"}
variable "public_subnet1" { default = "10.0.1.0/24"}
variable "public_subnet2" { default = "10.0.2.0/24"}
variable "private_subnet1" { default = "10.0.3.0/24"}
variable "private_subnet2" { default = "10.0.4.0/24"}

provider "aws" {
  region                      = var.region
}

locals {
  cluster_name = "PlanA-cluster"
  vpc_name    = "Main"
}

data "aws_availability_zones" "available" {}

provider "kubernetes" {
    host                   = data.aws_eks_cluster.cluster.endpoint
    token                  = data.aws_eks_cluster_auth.cluster.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

