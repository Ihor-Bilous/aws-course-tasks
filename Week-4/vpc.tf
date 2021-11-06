resource "aws_vpc" "week4-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "week4-vpc"
  }
}

resource "aws_subnet" "public-week4-subnet" {
  vpc_id                  = aws_vpc.week4-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zones[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "public-week4-subnet"
  }
}

resource "aws_subnet" "private-week4-subnet" {
  vpc_id                  = aws_vpc.week4-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.availability_zones[1]
  map_public_ip_on_launch = false
  tags = {
    Name = "private-week4-subnet"
  }
}

resource "aws_internet_gateway" "week4-igw" {
  vpc_id = aws_vpc.week4-vpc.id
  tags = {
    Name = "week4-igw"
  }
}

resource "aws_route_table" "public-week4-rt" {
  vpc_id = aws_vpc.week4-vpc.id
  tags = {
    Name = "public-week4-rt"
  }
}

resource "aws_route_table" "private-week4-rt" {
  vpc_id = aws_vpc.week4-vpc.id
  tags = {
    Name = "private-week4-rt"
  }
}

resource "aws_route" "public-week4-route" {
  route_table_id         = aws_route_table.public-week4-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.week4-igw.id
  depends_on             = [aws_route_table.public-week4-rt]
}

resource "aws_route" "private-week4-route" {
  route_table_id         = aws_route_table.private-week4-rt.id
  destination_cidr_block = "0.0.0.0/0"
  instance_id            = aws_instance.nat_instance.id
  depends_on             = [aws_route_table.private-week4-rt]
}

resource "aws_route_table_association" "public-week4-rt-ass" {
  subnet_id      = aws_subnet.public-week4-subnet.id
  route_table_id = aws_route_table.public-week4-rt.id
}

resource "aws_route_table_association" "private-week4-rt-ass" {
  subnet_id      = aws_subnet.private-week4-subnet.id
  route_table_id = aws_route_table.private-week4-rt.id
}