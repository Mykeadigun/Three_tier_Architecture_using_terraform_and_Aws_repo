resource "aws_instance" "web_instance1" {
  ami                     = data.aws_ssm_parameter.instance_ami.value
  instance_type           = "${t2.micro}"
  key_name                = "${keypair}"
  vpc_security_group_ids  = "${aws.security_groups.web_server.id}"
  subnet_id               = "${aws_subnet.websubnet1.id}"
  associate_public_ip_address = true
  user_data = "${file(data.sh)}"
}

resource "aws_instance" "web_instance2" {
  ami                     = data.aws_ssm_parameter.instance_ami.value
  instance_type           = "${t2.micro}"
  key_name                = "${keypair}"
  vpc_security_group_ids  = "${aws.security_groups.web_server.id}"
  subnet_id               = "${aws_subnet.websubnet2.id}"
  associate_public_ip_address = true
  user_data = "${file(data.sh)}"
}