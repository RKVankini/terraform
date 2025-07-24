module "prod" {
    source = "github.com/RKVankini/terraform/9ninth-day-modules"
    ami_id = var.ami_id
    instance_type = var.instance_type
    key = var.key
    az = var.az
}
