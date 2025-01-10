resource "aws_db_subnet_group" "sng" {
  name       = "db-subnet-group"
  subnet_ids = local.private_subnet_id
  tags = {
    Name = "DB Subnet Group"
  }
}