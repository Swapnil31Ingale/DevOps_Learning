resource "aws_eip" "nat_eip" {
    domain   = "vpc"
}
resource "aws_nat_gateway" "public_nat_gateway" {
  allocation_id = aws_eip.nat_eip.id    
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "TestPublicNatGateway"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.public_nat_gateway.id
}
