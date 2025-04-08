resource "aws_vpc" "vpc_a" {
  cidr_block = var.vpc_a_cidr
  tags = { 
    Name = "VPC-A" 
  }
}

# Subnets
# Create a public subnet in VPC A, AZ 1
resource "aws_subnet" "public_subnet_a_1a" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = var.vpc_a_public_subnet_az1
  availability_zone = var.region_a_az1
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-A-1a"
  }
}
# Create a public subnet in VPC A, AZ 2
resource "aws_subnet" "public_subnet_a_1a" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = var.vpc_a_public_subnet_az2
  availability_zone = var.region_a_az2
  tags = {
    Name = "public-subnet-A-1b"
  }
}
# Create a private subnet in VPC A, AZ 2
resource "aws_subnet" "private_subnet_a_1a" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = var.vpc_a_private_subnet_az2
  availability_zone = var.region_a_az2
  tags = {
    Name = "private-subnet-A-1b"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw_a" {
  vpc_id = aws_vpc.vpc_a.id
  tags = {
    Name = "IGW-A"
  }
}

# Route Table
# public RT
resource "aws_route_table" "public_route_table_a" {
  vpc_id = aws_vpc.vpc_a.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_a.id
  }
  tags = {
    Name = "public_route_table_A"
  }
}
# private RT
resource "aws_route_table" "private_route_table_a" {
  vpc_id = aws_vpc.vpc_a.id
  tags = {
    Name = "private_route_table_A"
  }
}

# Route Table Association
resource "aws_route_table_association" "public_subnet_a_1a" {
  subnet_id      = aws_subnet.public_subnet_a_1a.id
  route_table_id = aws_route_table.public_route_table_a.id
}
resource "aws_route_table_association" "public_subnet_a_1b" {
  subnet_id      = aws_subnet.public_subnet_a_1b.id
  route_table_id = aws_route_table.public_route_table_a.id
}
resource "aws_route_table_association" "private_subnet_a_1b" {
  subnet_id      = aws_subnet.private_subnet_a_1a.id
  route_table_id = aws_route_table.private_route_table_a.id
}

# NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc = true
}
resource "aws_nat_gateway" "nat_gw_a" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_a_1b.id
  tags = {
    Name = "NAT-GW-A"
  }
}

# Route for private subnet to NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table_a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw_a.id
}