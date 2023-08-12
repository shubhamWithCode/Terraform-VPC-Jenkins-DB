#######################################################################################
# AWS VPC Creation
#######################################################################################

resource "aws_vpc" "our-vpc" {
  cidr_block = var.vpc_cidr_value
  tags = {
    Name : "Our-VPC"
    Environment : var.environment
  }
}

########################################################################################
# AWS IGW CREATION
########################################################################################

resource "aws_internet_gateway" "our-igw" {
  vpc_id = aws_vpc.our-vpc.id
  tags = {
    Name : "Our-IGW"
    Environment : var.environment
  }
}

########################################################################################
# AWS SUBNET CREATION
########################################################################################

resource "aws_subnet" "our-public-subnet" {
  vpc_id                  = aws_vpc.our-vpc.id
  cidr_block              = var.public-subnet-cidr-value
  map_public_ip_on_launch = true
  availability_zone               = data.aws_availability_zones.available.names[0]
  tags = {
    Name : "Our-Public-Subnet"
    Environment : var.environment
  }
}

resource "aws_subnet" "our-private-subnet" {
  vpc_id                  = aws_vpc.our-vpc.id
  cidr_block              = var.private-subnet-cidr-value
  map_public_ip_on_launch = false
  availability_zone               = data.aws_availability_zones.available.names[0]
  tags = {
    Name : "Our-Private-Subnet"
    Environment : var.environment
  }
}

########################################################################################
# AWS ROUTE TABLE CREATION
########################################################################################

resource "aws_route_table" "our-public-route-table" {
  vpc_id = aws_vpc.our-vpc.id
  tags = {
    Name : "Our-Public-Route-Table"
    Environment : var.environment
  }
}

resource "aws_route_table" "our-private-route-table" {
  vpc_id = aws_vpc.our-vpc.id
  tags = {
    Name : "Our-Private-Route-Table"
    Environment : var.environment
  }
}

########################################################################################
# AWS SUBNET ROUTE TABLE ASSOCIATION
########################################################################################

resource "aws_route_table_association" "our-public-route-table-association" {
  subnet_id      = aws_subnet.our-public-subnet.id
  route_table_id = aws_route_table.our-public-route-table.id
}

resource "aws_route_table_association" "our-private-route-table-association" {
  subnet_id      = aws_subnet.our-private-subnet.id
  route_table_id = aws_route_table.our-private-route-table.id
}

########################################################################################
# AWS ROUTE ADDITION INTO ROUTE TABLES
########################################################################################

resource "aws_route" "our-public-route" {
  route_table_id         = aws_route_table.our-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.our-igw.id
}

########################################################################################
# AWS SECURITY GROUP
########################################################################################

resource "aws_security_group" "our-security-group" {
  name = "Our-Security-Group"
  description = "Our Security Group"
  vpc_id = aws_vpc.our-vpc.id
  tags = {
    Name : "Our-Security-Group"
    Environment : var.environment
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}