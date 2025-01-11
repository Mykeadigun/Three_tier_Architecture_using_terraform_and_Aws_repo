resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "My-Main-VPC"
    key_name = "3tier"
  }
}