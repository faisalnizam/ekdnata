// Module specific variables
//variable "availability_zones" { default = [] }
variable "name" {}
variable "environment" { default = "" }
variable "subnets"  { default = [] }
variable "security_groups" { default = [] }
variable "ssl_certificate_id" {} 
variable "cluster_name" {}
variable "tag_product" { default = "" }
variable "tag_purpose" { default = "" }
variable "source_cidr_block" { default = ["0.0.0.0/0"]  }
variable "instances" { default = [] }
variable "availability_zones" { default = [] } 
variable "health_check_port" { default = "" } 
