resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "first_public_subnet_rt_ass" {
  subnet_id      = aws_subnet.first_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "second_public_subnet_rt_ass" {
  subnet_id      = aws_subnet.second_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = var.nat_ec2_instance_id
  }
  tags   = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "first_private-rt-ass" {
  subnet_id      = aws_subnet.first_private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "second_private-rt-ass" {
  subnet_id      = aws_subnet.second_private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}