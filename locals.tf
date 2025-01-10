locals {
  public_subnet_id = [
    aws_subnet.websubnet.id,
    aws_subnet.websubnet2.id
  ]
}
locals {
  private_subnet_id = [
    aws_subnet.appsubnet1,
    aws_subnet.appsubnet2,
    aws_subnet.datasubnet1,
    aws_subnet.datasubnet2
  ]
}