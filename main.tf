#Create VPC
resource "aws_vpc" "project10VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "project10VPC"
  }
}
#Create Public Subnet1
resource "aws_subnet" "project10-publicsubnet1" {
  vpc_id     = aws_vpc.project10VPC.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch= true

  tags = {
    Name = "project10-publicsubnet1"
  }
}

#Create Public Subnet2
resource "aws_subnet" "project10-publicsubnet2" {
  vpc_id     = aws_vpc.project10VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "project10-publicsubnet2"
  }
}

#Create Public Subnet3
resource "aws_subnet" "project10-publicsubnet3" {
  vpc_id     = aws_vpc.project10VPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "project10-publicsubnet3"
  }
}

#Create Private Subnets
resource "aws_subnet" "project10-privatesubnet1" {
  vpc_id     = aws_vpc.project10VPC.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "project10-privatesubnet1"
  }
}

resource "aws_subnet" "project10-privatesubnet2" {
  vpc_id     = aws_vpc.project10VPC.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "project10-privatesubnet2"
  }
}

resource "aws_subnet" "project10-privatesubnet3" {
  vpc_id     = aws_vpc.project10VPC.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "project10-privatesubnet3"
  }
}

#Create Route Table for Public Routes
resource "aws_route_table" "project10-publicroutetable" {
  vpc_id = aws_vpc.project10VPC.id


  tags = {
    Name = "project10-publicroutetable"
  }
}

#Create Route Table for Private Routes
resource "aws_route_table" "project10-privateroutetable" {
  vpc_id = aws_vpc.project10VPC.id

  tags = {
    Name = "project10-privateroutetable"
  }
}

#Create RTA for Public Subnet1
resource "aws_route_table_association" "publicp10-rta1" {
  subnet_id      = aws_subnet.project10-publicsubnet1.id
  route_table_id = aws_route_table.project10-publicroutetable.id
}

#Create RTA for Public Subnet2
resource "aws_route_table_association" "publicp10-rta2" {
  subnet_id      = aws_subnet.project10-publicsubnet2.id
  route_table_id = aws_route_table.project10-publicroutetable.id
}

#Create RTA for Public Subnet3
resource "aws_route_table_association" "publicp10-rta3" {
  subnet_id      = aws_subnet.project10-publicsubnet3.id
  route_table_id = aws_route_table.project10-publicroutetable.id
}

#Create RTA for Private Subnet1
resource "aws_route_table_association" "privatep10-rta1" {
  subnet_id      = aws_subnet.project10-privatesubnet1.id
  route_table_id = aws_route_table.project10-privateroutetable.id
}

#Create RTA for Private Subnet2
resource "aws_route_table_association" "privatep10-rta2" {
  subnet_id      = aws_subnet.project10-privatesubnet2.id
  route_table_id = aws_route_table.project10-privateroutetable.id
}
#Create RTA for Private Subnet3
resource "aws_route_table_association" "privatep10-rta3" {
  subnet_id      = aws_subnet.project10-privatesubnet3.id
  route_table_id = aws_route_table.project10-privateroutetable.id
}

#Create IGW
resource "aws_internet_gateway" "Project10-igw" {
  vpc_id = aws_vpc.project10VPC.id

  tags = {
    Name = "Project10-igw"
  }
}

#Create Route for IGW
resource "aws_route" "publicp8-igw-route" {
  route_table_id            = aws_route_table.project10-publicroutetable.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                =aws_internet_gateway.Project10-igw.id
}
