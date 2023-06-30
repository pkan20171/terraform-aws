resource "aws_vpc" "kp_eks_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    "Name" = "${var.environment}-vpc"
  }
}