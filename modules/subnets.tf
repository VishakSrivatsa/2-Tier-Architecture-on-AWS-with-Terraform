#Creating Subnets
# public subnet 1
resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.public_subnet1
  availability_zone = var.az1

  tags = {
    name = "public_subnet1"
  }
}


# public subnet 2
resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.public_subnet2
  availability_zone = var.az2

  tags = {
    name = "public_subnet2"
  }
}


# private subnet 1
resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.private_subnet1
  availability_zone = var.az1

  tags = {
    name = "private_subnet1"
  }
}


# private subnet 2
resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.private_subnet2
  availability_zone = var.az2

  tags = {
    name = "private_subnet2"
  }
}