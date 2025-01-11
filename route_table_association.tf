resource "aws_route_table_association" "public_association" {
  count = length(var.public_subnet)
  subnet_id = element(var.public_subnet, count.index)
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "private_association" {
  count = length(var.private_subnet)
  subnet_id = element(var.private_subnet, count.index)
  route_table_id = aws_route_table.private.id
}