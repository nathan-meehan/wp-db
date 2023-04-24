output "db_sg_id" {
  value = aws_security_group.wpdb_sg.id
}

output "sg_id" {
  value = aws_security_group.wpec2_sg.id
}

