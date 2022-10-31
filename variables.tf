## prompt for API key and passwords
variable "aws_access_key" {}
variable "aws_secret_key" {
}

variable "redshift_master_pwd" {
}

variable "rbs_master_pwd" {

}

## enviroment variables
variable "enviroment" {
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
    public_subnet.mao_public_ip_on_launch = "true"
    public_subnet.availability_zone       = "ap-southeast-2"

    # private subnet
  }

}
