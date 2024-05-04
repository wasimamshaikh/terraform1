resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Sec group for web"
  vpc_id      = aws_vpc.web-vpc.id

  tags = {
    Name = "web-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = aws_vpc.web-vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4-1" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = aws_vpc.web-vpc.cidr_block
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}