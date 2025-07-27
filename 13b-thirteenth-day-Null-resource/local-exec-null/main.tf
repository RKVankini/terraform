resource "aws_db_instance" "mysql_rds" {
  identifier              = var.db_identifier        # RDS instance name (with RK-terra prefix)
  engine                  = var.db_engine            # DB engine type, e.g., mysql
  instance_class          = var.db_instance_class    # Instance size
  username                = var.db_username          # Master DB username
  password                = var.db_password          # Master DB password
  db_name                 = var.db_name              # Initial database name
  allocated_storage       = var.allocated_storage    # Storage size in GB
  skip_final_snapshot     = true                     # Skip snapshot during destroy
  publicly_accessible     = true                     # Allow access from internet (use security group!)
}

resource "null_resource" "local_sql_exec" {
  depends_on = [aws_db_instance.mysql_rds]

  provisioner "local-exec" {
    command = "mysql -h ${aws_db_instance.mysql_rds.address} -u ${var.db_username} -p${var.db_password} ${var.db_name} < ${var.sql_file_path}"
    # Executes local SQL script after RDS is created
  }

  triggers = {
    always_run = timestamp()  # Ensures it runs on every apply
  }
}
