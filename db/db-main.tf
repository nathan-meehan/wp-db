resource "aws_db_instance" "wpdb" {
  allocated_storage    = 10
  db_name              = "wpdb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = ""
  skip_final_snapshot  = true
  vpc_security_group_ids = [var.sg_id]
}