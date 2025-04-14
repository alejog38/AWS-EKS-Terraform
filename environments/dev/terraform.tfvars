cidr_block = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
azs = ["us-east-1a", "us-east-1b"]
cluster_name = "dev-cluster"
kubernetes_version = "1.27"
db_name = "appdb"
db_user = "admin"
db_password = "changeme123"
db_sg_id = "sg-12345678"
tags = {
  Environment = "dev"
  Project     = "aws-infra"
}