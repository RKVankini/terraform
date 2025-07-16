aws_region              = "ap-south-1"

vpc_cidr                = "10.0.0.0/16"
vpc_name                = "RK-terra"

subnet1_cidr            = "10.0.0.0/24"
subnet2_cidr            = "10.0.1.0/24"
subnet1_az              = "ap-south-1a"
subnet2_az              = "ap-south-1b"

db_subnet_group_name    = "rk-terra-sub-1"

db_identifier           = "rk-terra-rds"
db_name                 = "mydb"
db_engine               = "mysql"
db_engine_version       = "8.0"
instance_class          = "db.t3.micro"

db_username             = "admin"
db_password             = "Chintu96"  # You can override this securely in CI/CD
parameter_group_name    = "default.mysql8.0"

allocated_storage       = 10
backup_retention_period = 7
backup_window           = "02:00-03:00"
maintenance_window      = "sun:04:00-sun:05:00"

deletion_protection     = true
skip_final_snapshot     = true

secret_name             = "rk-terra-rds-secret"
db_port                 = 3306
