resource "aws_security_group" "kp_default_group" {
  name        = "${var.environment}-default-sg"
  description = "Default security group for EKS VPC network"
  vpc_id      = aws_vpc.kp_eks_vpc.id
  depends_on = [
    aws_vpc.kp_eks_vpc
  ]

  tags = {
    "Name" = "${var.environment}-default-sg"
  }
}