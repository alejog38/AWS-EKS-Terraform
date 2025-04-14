variable "cluster_name" {}
variable "kubernetes_version" {}
variable "private_subnets" { type = list(string) }
variable "vpc_id" {}
variable "tags" { type = map(string) }
variable "aws_auth_roles" { type = list(object({ rolearn = string, username = string, groups = list(string) })) }