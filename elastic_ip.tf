#Eip cretation
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}