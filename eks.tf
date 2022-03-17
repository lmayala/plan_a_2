module "eks"{
    source = "terraform-aws-modules/eks/aws"
    version = "17.1.0"
    cluster_name = local.cluster_name
    cluster_version = "1.21"
    subnets = module.vpc.private_subnets
    tags = {
        Name = "Demo for Plan A"
    }

    vpc_id = module.vpc.vpc_id
    workers_group_defaults = {
        root_volume_type = "gp2"
    }
  node_groups = {
    example = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2

      instance_type = "t3a.large"
      k8s_labels = {
        Environment = "test"
        GithubRepo  = "plan_a"
        GithubOrg   = "lmayala"
      }
      additional_tags = {
        ExtraTag = "example"
      }
    }
  }

}
data "aws_eks_cluster" "cluster" {
    name = module.eks.cluster_id
}
data "aws_eks_cluster_auth" "cluster" {
    name = module.eks.cluster_id
}

