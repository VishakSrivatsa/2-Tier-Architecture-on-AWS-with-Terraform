# creating VPC

resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    name = "custom_vpc"
  }
}
