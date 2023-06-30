resource "aws_eip" "kp_nat_eip" {
  vpc = true

  tags = {
    "Name" = "${var.environment}-nat-eip"
  }
}