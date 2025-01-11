#Nat Creation
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.websubnet.id
    connectivity_type = "public"
    tags = {
      Name = "nat-gw-three-tier-app"
    }
}
