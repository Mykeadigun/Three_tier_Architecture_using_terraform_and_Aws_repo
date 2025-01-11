
resource "aws_subnet" "websubnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet1_cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true 
  tags = {
    Name = " Web_Subnet_1"
  }
}
resource "aws_subnet" "websubnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet2_cidr}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true 
  tags = {
    Name = " Web_Subnet_2"
  }
}
resource "aws_subnet" "appsubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet3_cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = " App_Subnet_1"
  }
}
resource "aws_subnet" "appsubnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet4_cidr}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = " App_Subnet_2"
  }
}
resource "aws_subnet" "datasubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet5_cidr}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Data_Subnet_1"
  }
}
resource "aws_subnet" "datasubnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "${var.subnet6_cidr}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = " Data_Subnet_2"
  }
}