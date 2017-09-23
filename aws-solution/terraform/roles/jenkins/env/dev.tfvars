region = "eu-west-1"
environment = "dev"
jenkins = "jenkins" 
profile = "dev" 
env = "dev"
region = "eu-west-1"
key_name ="iacfaisal"
name = "jenkins"
application = "jenkins"

vpc = "data_vpc"
vpc_id = "vpc-50854937"
default_subnet = "subnet-a2474ffa"

count = 1
ami_id = "ami-00787074"
instance_type = "t2.micro"

associate_public_ip_address = "34.240.83.9"
eip = "34.240.83.9"
dns_name = "jenkins" 
dns_address = "jenkins.mansit.co.uk" // Mansit.co.uk and logiik.com are my domain , faar@mansit.co.uk
zone_id = "ZE6RLHQ5I7GDD"
dns_ttl = "60"
record_type = "A" 

from_port = "22" 
to_port = "65535" 
health_check_port = "8080" 
ssl_certificate_id = "nill" 

cidr_blocks = "0.0.0.0/0"
dns_records = ["0.0.0.0"]
subnet_id = "subnet-a2474ffa" 
vpc_zone_identifier = ["subnet-a2474ffa", "subnet-42418c25", "subnet-2a599163"]
vpc_zone_identifier_ec2 = ["subnet-a2474ffa", "subnet-42418c25", "subnet-2a599163"]
availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

health_check_type = "ELB"
load_balancers = ["abc-def12345"]
hostname = "jenkins"
domain = "mansit.co.uk"

min_size = 1
max_size = 3
monitoring = "false"
delete = "false"

cluster_name = "jenkins"
tag_product = "jenkins"
tag_purpose = "Jenkins Server"
archive_link = "https://github.com/faisalnizam/ekdnata/archive/master.zip"

jenkins_server = {
  count = 1
}
total_instances = 1

aws_security_group_id = {
  sg_id = ["sg-c57b85ae"]
}


