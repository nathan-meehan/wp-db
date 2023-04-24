##db needs to be created before this works
resource "aws_instance" "tf_wp" {
  ami                         = "ami-00c39f71452c08778"
  instance_type               = "t2.micro"
  subnet_id                   = var.sn_id
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  key_name = "nathan-m-kp"
  user_data                   = filebase64("${path.module}/web.sh")


    provisioner "remote-exec" {
        inline = ["sleep 20"]

        connection {
        host        = self.public_ip
        type        = "ssh"
        user        = "ec2-user"
        private_key = file(var.pvt_key)
        }
    }

    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.public_ip},' --private-key ${var.pvt_key} --extra-vars 'db_host=${var.db_host}' pb_wp_conf.yml"
    }
    

}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = var.db_sg_id

  cidr_ipv4   = "${aws_instance.tf_wp.private_ip}/32"
  from_port   = 3306
  ip_protocol = "tcp"
  to_port     = 3306
}