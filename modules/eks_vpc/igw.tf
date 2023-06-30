resource "aws_internet_gateway" "kp_igw" {
  vpc_id = aws_vpc.kp_eks_vpc.id

  tags = {
    "Name" = "${var.environment}-igw"
  }
}