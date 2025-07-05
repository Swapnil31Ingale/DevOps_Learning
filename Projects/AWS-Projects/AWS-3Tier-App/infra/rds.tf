resource "aws_db_instance" "private_rds" {
  allocated_storage      = 10
  db_name                = "TestDB"
  engine                 = "postgres"
  engine_version         = "17.5"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = local.rds_password
  parameter_group_name   = "default.postgres17"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow inbound traffic to RDS instance"
  vpc_id      = aws_vpc.main.id
    tags = {
        Name = "TestRDSecurityGroup"
    }
}
resource "aws_vpc_security_group_ingress_rule" "inbound_rds_rules" {
  security_group_id            = aws_security_group.rds_sg.id
  referenced_security_group_id = aws_security_group.private_sg.id
  # Allow SSH access from the private Host
  ip_protocol                  = "tcp"
  to_port                      = 5432
  from_port                    = 5432
  description = "Allow PostgreSQL access from the Private EC2 Instance"
}

resource "aws_vpc_security_group_egress_rule" "outbound_rds_rules" {
  security_group_id = aws_security_group.rds_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id]  # Add second AZ subnet later

  tags = {
    Name = "RDSSubnetGroup"
  }
}

resource "aws_secretsmanager_secret" "rds_password" {
  name = "rds_password"
}

resource "aws_secretsmanager_secret_version" "rds_password_version" {
  secret_id     = aws_secretsmanager_secret.rds_password.id
  secret_string = jsonencode({ password = var.rds_password })
}

data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = aws_secretsmanager_secret.rds_password.id
}

locals {
  rds_password = jsondecode(data.aws_secretsmanager_secret_version.rds_password.secret_string).password
}
