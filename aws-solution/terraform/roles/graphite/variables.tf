data "aws_availability_zones" "available" {}

data "aws_vpc" "qa-vpc" {
  tags = {
    Name = "qa-vpc"
  }
}

variable "role" {
  default = "graphite"
}

variable "archive_link" {
  default = ""
}

variable "vpc" {
  default = "data_vpc"
}

variable "region" {}

variable "public_subnet_id" {
  default = []
}

variable "private_subnet_id" {
  default = ""
}

variable environment {
  type    = "string"
  default = "dev"
}

variable name {
  type    = "string"
  default = "test-module"
}

variable application {
  type    = "string"
  default = "app"
}

variable count {
  type    = "string"
  default = "1"
}

variable ami_id {
  type    = "string"
  default = "ami-ed82e39e"
}

variable instance_type {
  type    = "string"
  default = "t2.nano"
}

variable key_name {
  type    = "string"
  default = "<public-ssh-key>"
}

variable cidr_blocks {
  default = []
}

variable block_device {
  type = "map"

  default = {
    type        = "s3"
    volume_size = "1024"
  }
}

variable "graphite" {
  default = {
    "extra_user_data" = ""
    "key_name"        = ""
    "ami"             = ""
    "instance_type"   = ""
  }
}
