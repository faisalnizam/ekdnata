# Variable With Preferred Values 

variable "jenkins_server" {
  default = {
    ami           = "ami-7abd0209"
    instance_type = "m4.xlarge"
    instance_name = "jenkins server"
    role          = "ci/cd server"
    count         = 1
  }
}

variable "name" {
  default = "jenkins-cluster"
}

variable "vpc_id" {
  default = "vpc-1e0b1c7a"
}

variable "aws_security_group_id" {
  default = {
    sg_id = [""]
  }
}

variable "default_subnet" {
  default = "subnet-62b3ac06"
}

variable "key_name" {
  default = "dnata"
}

variable "zone_id" {
  default = "ZE6RLHQ5I7GDD"
}

variable "block_device" {
  default = "ephemeral"
}

variable "env" {
  default = "dev"
}

variable "vpc" {
  default = "vpc-1e0b1c7a"
}

variable "tags" {
  type    = "map"
  default = {}
}

variable "orchestration" {
  default = false
}

# Variables With No Constant Values 
variable "cidr_blocks" {}

variable "to_port" {}
variable "from_port" {}
variable "profile" {}
variable "dns_address" {}
variable "record_type" {}
variable "cluster_name" {}
variable "health_check_port" {}
variable "vpc_zone_identifier" {}
variable "ssl_certificate_id" {}
variable "vpc_zone_identifier_ec2" {}
variable "min_size" {}
variable "monitoring" {}
variable "delete" {}
variable "jenkins" {}
variable "max_size" {}
variable "ami_id" {}
variable "availability_zones" {}
variable "total_instances" {}
variable "archive_link" {}
variable "awskey" {}
variable "awssecret" {}
variable "region" {}
variable "environment" {}
