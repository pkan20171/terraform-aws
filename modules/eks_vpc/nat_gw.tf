resource "aws_nat_gateway" "kp_nat_gw" {
  subnet_id     = element(aws_subnet.kp_eks_public_subnets.*.id, 0)
  allocation_id = aws_eip.kp_nat_eip.id

  depends_on = [
    aws_subnet.kp_eks_public_subnets,
    aws_eip.kp_nat_eip
  ]

  tags = {
    "Name" = "${var.environment}-nat-gw"
  }
}