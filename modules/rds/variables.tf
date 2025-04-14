variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
variable "private_subnets" { type = list(string) }
variable "db_sg_id" {}
variable "tags" { type = map(string) }