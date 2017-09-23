output "elb_dns_name" {
  value = "${module.elb.elb_dns_name}"
}

output "ec2_instance_id" {
  value = ["${module.ec2.ec2_instance_id}"]
}
