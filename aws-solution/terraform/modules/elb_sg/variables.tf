// Module specific variables
variable "name" { default = "" }
variable "environment" { default = "" }
variable "source_cidr_block" { default = "0.0.0.0/0" }

variable "vpc_id" {}
variable "cluster_name" {}
variable "tag_product" { default = "" }
variable "tag_purpose" { default = "" }
variable "cidr_blocks" { default = [] }
