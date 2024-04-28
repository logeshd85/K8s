resource "aws_vpc" "appvpc" {
  cidr_block = "10.0.0.0/22"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "appsubnet1" {
  vpc_id = aws_vpc.appvpc.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "appsubnet2" {
  vpc_id = aws_vpc.appvpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "appsubnet3" {
  vpc_id = aws_vpc.appvpc.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "appsubnet4" {
  vpc_id = aws_vpc.appvpc.id
  cidr_block = "10.0.3.0/24"
}

resource "aws_internet_gateway" "appigw" {
  vpc_id = aws_vpc.appvpc.id
}

resource "aws_route_table" "apprtb" {
  vpc_id = aws_vpc.appvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.appigw.id
  }
}

resource "aws_route_table_association" "appsubnet1_association" {
  subnet_id = aws_subnet.appsubnet1.id
  route_table_id = aws_route_table.apprtb.id
}

resource "aws_route_table_association" "appsubnet2_association" {
  subnet_id = aws_subnet.appsubnet2.id
  route_table_id = aws_route_table.apprtb.id
}

resource "aws_route_table_association" "appsubnet3_association" {
  subnet_id = aws_subnet.appsubnet3.id
  route_table_id = aws_route_table.apprtb.id
}

resource "aws_route_table_association" "appsubnet4_association" {
  subnet_id = aws_subnet.appsubnet4.id
  route_table_id = aws_route_table.apprtb.id 
}