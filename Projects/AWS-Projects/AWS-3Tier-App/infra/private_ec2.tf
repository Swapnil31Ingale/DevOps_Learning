resource "aws_instance" "private_EC2" {
  ami                         = "ami-0c02fb55956c7d316"
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet.id
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false  
  tags = {
    Name = "TestPrivateEC2"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "TestSecurityGroup"
  }
}

resource "aws_vpc_security_group_ingress_rule" "inbound_private_rules" {
  security_group_id            = aws_security_group.private_sg.id
  referenced_security_group_id = aws_security_group.bastion_sg.id
  ip_protocol                  = "tcp"
  to_port                      = 22
  from_port                    = 22
  description = "Allow SSH access from the Bastion Host"
}

resource "aws_vpc_security_group_egress_rule" "outbound_private_rules" {
  security_group_id = aws_security_group.private_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1" # semantically equivalent to all ports
}