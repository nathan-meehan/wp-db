resource "aws_security_group" "wpdb_sg" {
  name        = "wpdb_sg"
  description = ""
  vpc_id      = var.vpc_id

}

resource "aws_vpc_security_group_egress_rule" "example" {
  security_group_id = aws_security_group.wpdb_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}


resource "aws_security_group" "wpec2_sg" {
  name        = "wordpress ec2 sg"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from all"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
