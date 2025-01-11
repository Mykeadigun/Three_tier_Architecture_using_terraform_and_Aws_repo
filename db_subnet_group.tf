resource "aws_db_subnet_group" "sng" {
  name       = "db-subnet-group"
  subnet_ids = "${element(var.private_subnet, count.index)}"
  count = length(var.private_subnet)
  tags = {
    Name = "DB Subnet Group"
  }
}