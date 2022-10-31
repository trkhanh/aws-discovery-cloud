## prompt for API keys and passwords
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "redshift_master_pwd" {}
variable "rds_master_pwd" {}

## environment variables
variable "environment" {
  type = map(string)
  default = {
    resourceprefix = "nab-dc-"
  }
}

## VPC variables
variable "vpc" {
  type = map(string)
  default = {
    aws_region = "ap-southeast-2"
    vpc_cidr   = "10.0.0.0/16"
    # public subnet
    public_subnet.description             = "Public Subnet"
    public_subnet.cidr_block              = "10.0.0.0/24"
    public_subnet.map_public_ip_on_launch = "true"
    public_subnet.availability_zone       = "ap-southeast-2a"
    # private subnet 1
    private_subnet1.description             = "Private Subnet 1"
    private_subnet1.cidr_block              = "10.0.1.0/24"
    private_subnet1.map_public_ip_on_launch = "false"
    private_subnet1.availability_zone       = "ap-southeast-2b"
    # private subnet 2
    private_subnet2.description             = "Private Subnet 2"
    private_subnet2.cidr_block              = "10.0.2.0/24"
    private_subnet2.map_public_ip_on_launch = "false"
    private_subnet2.availability_zone       = "ap-southeast-2c"
  }
}

## EC2 variables
variable "ec2" {
  type = map(string)
  default = {
    ec2_keypair                 = "avensolutions"
    instance_type               = "t2.micro"
    ami                         = "ami-30041c53"
    associate_public_ip_address = "true"
    pgweb.port                  = "8081"
    rstudio.port                = "8787"
    shiny.port                  = "3838"
    jupyter.port                = "8888"
  }
}

## RDS variables
variable "rds" {
  type = map(string)
  default = {
    # Instance
    identifier          = "rdsdbinst"
    name                = "metastoredb"
    allocated_storage   = "5"
    instance_class      = "db.t2.small"
    multi_az            = "true"
    storage_type        = "gp2"
    publicly_accessible = "false"
    storage_encrypted   = "true"
    # DB Engine
    engine               = "mariadb"
    license_model        = "general-public-license"
    option_group_name    = "default:mariadb-10-0"
    engine_version       = "10.0.24"
    username             = "hive"
    port                 = "3306"
    parameter_group_name = "default.mariadb10.0"
    # Upgrades
    allow_major_version_upgrade = "false"
    auto_minor_version_upgrade  = "true"
    apply_immediately           = "false"
    maintenance_window          = "fri:15:15-fri:15:45"
    # Snapshots and backups
    skip_final_snapshot     = "true"
    copy_tags_to_snapshot   = "false"
    backup_retention_period = "7"
    backup_window           = "12:25-12:55"
    # enhanced monitoring
    # monitoring_interval = "60"
    # monitoring_role_arn = ""		
  }
}

## Redshift variables
variable "redshift" {
  type = map(string)
  default = {
    database_name       = "analyticsdb"
    node_type           = "dc1.large"
    cluster_type        = "single-node"
    master_username     = "master"
    encrypted           = "true"
    publicly_accessible = "false"
    skip_final_snapshot = "true"
  }
}

## EMR variables
variable "emr" {
  type = map(string)
  default = {
    ec2_keypair = "avensolutions"
  }
}
