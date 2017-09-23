# Variable With Preferred Values 

variable "name" {
  default = "jenkins-cluster"
}

variable "aws_security_group_id" {
  default = {
    sg_id = [""]
  }
}

variable "default_subnet" {
  default = "subnet-62b3ac06"
}

variable "block_device" {
  default = "ephemeral"
}

variable "tags" {
  type    = "map"
  default = {}
}

variable "orchestration" {
  default = false
}

variable "availability_zones" {
  type    = "list"
  default = []
}

variable "vpc_zone_identifier_ec2" {
  type    = "list"
  default = []
}

variable "vpc_zone_identifier" {
  type    = "list"
  default = []
}

# Variables With No Constant Values 
variable "ami_id" {}

variable "vpc_id" {}
variable "key_name" {}
variable "zone_id" {}
variable "env" {}
variable "vpc" {}

variable "cidr_blocks" {}
variable "to_port" {}
variable "from_port" {}
variable "profile" {}
variable "dns_address" {}
variable "record_type" {}
variable "cluster_name" {}
variable "health_check_port" {}
variable "ssl_certificate_id" {}
variable "min_size" {}
variable "monitoring" {}
variable "delete" {}
variable "jenkins" {}
variable "max_size" {}
variable "total_instances" {}
variable "archive_link" {}
variable "region" {}
variable "environment" {}
variable "instance_type" {}
