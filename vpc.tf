resource "aws_vpc" "web-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "web-vpc"
  }
}

resource "aws_subnet" "web-sub-pub-1" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "web-sub-pub-1"
  }
}

resource "aws_subnet" "web-sub-pub-2" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "web-sub-pub-2"
  }
}

resource "aws_subnet" "web-sub-pri-1" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1

  tags = {
    Name = "web-sub-pri-1"
  }
}

resource "aws_subnet" "web-sub-pri-2" {
  vpc_id                  = aws_vpc.web-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2

  tags = {
    Name = "web-sub-pri-2"
  }
}

resource "aws_internet_gateway" "web-igw" {
  vpc_id = aws_vpc.web-vpc.id

  tags = {
    Name = "web-igw"
  }
}

resource "aws_route_table" "web-pub-RT" {
  vpc_id = aws_vpc.web-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web-igw.id
  }
  tags = {
    Name = "web-pub-RT"
  }
}

resource "aws_route_table_association" "web-pub-1-a" {
  subnet_id      = aws_subnet.web-sub-pub-1.id
  route_table_id = aws_route_table.web-pub-RT.id
}

resource "aws_route_table_association" "web-pub-2-a" {
  subnet_id      = aws_subnet.web-sub-pub-2.id
  route_table_id = aws_route_table.web-pub-RT.id
}