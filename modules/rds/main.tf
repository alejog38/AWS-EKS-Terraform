resource "aws_db_instance" "this" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14.3"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.db_user
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.db_sg_id]
  tags = var.tags
}

resource "aws_db_subnet_group" "this" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnets
  tags       = var.tags
}