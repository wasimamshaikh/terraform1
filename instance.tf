resource "aws_key_pair" "web-key" {
  key_name   = "webkey"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "web-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.web-sub-pub-1.id
  key_name               = aws_key_pair.web-key.key_name
  vpc_security_group_ids = [aws_security_group.web-sg.id]

  tags = {
    Name = "web-instance"
  }

}

output "PublicIP" {
  value = aws_instance.web-instance.public_ip
}