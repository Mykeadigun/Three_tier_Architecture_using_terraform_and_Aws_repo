resource "aws_launch_template" "launch_config" {
  name_prefix                = "launch_config"
  image_id                   = data.aws_ssm_parameter.instance_ami.value
  instance_type              = var.instance_type
  vpc_security_group_ids     = [aws_security_group.web_server.id]
  user_data                  = file("./data.sh")
  key_name                   = var.keypair
}