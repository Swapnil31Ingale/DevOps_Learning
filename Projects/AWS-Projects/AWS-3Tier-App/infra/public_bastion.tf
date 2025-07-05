# This file defines a public bastion host in AWS using Terraform.
resource "aws_instance" "public_bastion" {
  ami                         = "ami-0c02fb55956c7d316"
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true  # Ensures public IP is assigned
  tags = {
    Name = "TestPublicBastion"
  }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "TestSecurityGroup"
  }
}

resource "aws_vpc_security_group_ingress_rule" "inbound_bastion_rules" {
  security_group_id = aws_security_group.bastion_sg.id
# Allow SSH access from a specific IP address
  cidr_ipv4         = var.my_ip
  ip_protocol       = "tcp"
  to_port           = 22
  from_port         = 22
}

resource "aws_vpc_security_group_egress_rule" "outbound_bastion_rules" {
  security_group_id = aws_security_group.bastion_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1" # semantically equivalent to all ports
}

