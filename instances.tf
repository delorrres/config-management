resource "aws_instance" "web_server" {
  count = var.number_of_instances
  ami                    = data.aws_ami.aws_ubuntu.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = var.my_keypair

  tags = {
      Name = "public_server_${count.index + 1}"
  }
}