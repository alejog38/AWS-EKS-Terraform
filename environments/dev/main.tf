module "vpc" {
  source = "../../modules/vpc"
  cidr_block = var.cidr_block
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  azs = var.azs
  tags = var.tags
}

module "iam" {
  source = "../../modules/iam"
  tags = var.tags
}

module "eks" {
  source = "../../modules/eks"
  cluster_name = var.cluster_name
  kubernetes_version = var.kubernetes_version
  private_subnets = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  aws_auth_roles = [
    {
      rolearn  = module.iam.eks_node_role_arn
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = ["system:bootstrappers", "system:nodes"]
    },
    {
      rolearn  = module.iam.alb_controller_role_arn
      username = "alb-controller"
      groups   = ["system:masters"]
    }
  ]
  tags = var.tags
}

module "rds" {
  source = "../../modules/rds"
  db_name = var.db_name
  db_user = var.db_user
  db_password = var.db_password
  private_subnets = module.vpc.private_subnets
  db_sg_id = var.db_sg_id
  tags = var.tags
}