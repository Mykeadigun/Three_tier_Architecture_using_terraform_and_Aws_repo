resource "aws_db_subnet_group" "sng" {
  name       = "db-subnet-group"
  subnet_ids = var.private_subnet
  tags = {
    Name = "DB Subnet Group"
  }
}