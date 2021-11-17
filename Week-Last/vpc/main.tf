resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = {
    Name = "Last task VPC"
  }
}

resource "aws_subnet" "first_public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnets_cidr_blocks[0]
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags                    = {
    Name = "first_public_subnet"
  }
}

resource "aws_subnet" "second_public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnets_cidr_blocks[1]
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = true
  tags                    = {
    Name = "second_public_subnet"
  }
}

resource "aws_subnet" "first_private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnets_cidr_blocks[2]
  availability_zone       = var.availability_zones[2]
  map_public_ip_on_launch = false
  tags                    = {
    Name = "first_private_subnet"
  }
}

resource "aws_subnet" "second_private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnets_cidr_blocks[3]
  availability_zone       = var.availability_zones[3]
  map_public_ip_on_launch = false
  tags                    = {
    Name = "second_private_subnet"
  }
}