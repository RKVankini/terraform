module "RK_terra" {
    source = "../9ninth-day-modules"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key = var.key
    az = var.az
  
}