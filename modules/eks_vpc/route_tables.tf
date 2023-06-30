resource "aws_route_table" "kp_public_route" {
  vpc_id = aws_vpc.kp_eks_vpc.id

  tags = {
    "Name" = "${var.environment}-public-rt"
  }
}

resource "aws_route_table" "kp_private_route" {
  vpc_id = aws_vpc.kp_eks_vpc.id

  tags = {
    "Name" = "${var.environment}-private-rt"
  }
}

resource "aws_route" "kp_public_igw" {
  route_table_id         = aws_route_table.kp_public_route.id
  gateway_id             = aws_internet_gateway.kp_igw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_internet_gateway.kp_igw
  ]
}

resource "aws_route" "kp_private_nat" {
  route_table_id         = aws_route_table.kp_private_route.id
  nat_gateway_id         = aws_nat_gateway.kp_nat_gw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_nat_gateway.kp_nat_gw
  ]
}

resource "aws_route_table_association" "kp_public_assoc" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.kp_eks_public_subnets.*.id, count.index)
  route_table_id = aws_route_table.kp_public_route.id
}

resource "aws_route_table_association" "kp_private_assoc" {
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.kp_eks_private_subnets.*.id, count.index)
  route_table_id = aws_route_table.kp_private_route.id
}