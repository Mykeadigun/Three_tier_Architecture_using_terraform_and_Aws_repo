resource "aws_db_instance" "app_db" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "8.0.39"
  instance_class    = "db.t2.micro"
  username          = "miguel"
  password          = "1234567"
  db_name           = "app_rds_db"
  multi_az          = true 
  storage_type      = "gp2"
  

  # If you're using a VPC
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name  = aws_db_subnet_group.sng.id

  tags = {
    Name = "DB Instance"
  }
}