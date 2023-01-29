resource "aws_security_group" "public-instances-SG-x" {
  name        = var.SG_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "ssh connection from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_ips
  }

  ingress {
    description = "HTTP connection from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_ips
  }

  egress {
    description = "outbound to anywhere to anyprotocol"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.outbound_ips
  }

  tags = {
    Name = var.SG_name
  }
}

