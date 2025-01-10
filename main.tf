resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "My-Main-VPC"
    key_name = "3tier"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}
resource "aws_subnet" "websubnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true 
  tags = {
    Name = " Web_Subnet_1"
  }
}
resource "aws_subnet" "websubnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = " Web_Subnet_2"
  }
}
resource "aws_subnet" "appsubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = " App_Subnet_1"
  }
}
resource "aws_subnet" "appsubnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = " App_Subnet_2"
  }
}
resource "aws_subnet" "datasubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Data_Subnet_1"
  }
}
resource "aws_subnet" "datasubnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = " Data_Subnet_2"
  }
}

#InternetGateWay creation and attached to VPC creted
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "My-Internet-Gateway"
  }
}

#Eip cretation
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}
#Nat Creation
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.websubnet.id
    connectivity_type = "public"
    tags = {
      Name = "nat-gw-three-tier-app"
    }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table_association" "public_association" {
  count = length(local.public_subnet_id)
  subnet_id = element(local.public_subnet_id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "Private-Route-Table"
  }
}

resource "aws_route_table_association" "private_association" {
  count = length(local.private_subnet_id)
  subnet_id = element(local.private_subnet_id, count.index)
  route_table_id = aws_route_table.private.id
}

