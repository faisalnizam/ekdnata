provider "aws" {
  region  = "${var.region}"
  profile = "${var.environment}"
}

module "elb_sg" {
  source       = "../../modules/elb_sg"
  name         = "${var.role}-${var.environment}"
  environment  = "${var.environment}"
  vpc_id       = "${data.aws_vpc.data_vpc.id}"
  cluster_name = "graphite"
}

module "elb" {
  source          = "../../modules/elb"
  name            = "${var.role}-${var.environment}"
  environment     = "${var.environment}"
  security_groups = ["${module.elb_sg.elb_sg_id}"]
  subnets         = ["${var.public_subnet_id}"]

  //ssl_certificate_id = "arn:aws:acm:eu-central-1:319584929632:certificate/1582b471-6808-4beb-9f65-0b97ea189eb7"
  ssl_certificate_id = "arn:aws:acm:eu-central-1:433703733157:certificate/182a45ce-c132-4336-965d-66ac977d76cf"
  cluster_name       = "graphite"
}

module "sec_sg" {
  source = "../../modules/default_sg"
  name   = "${var.role}-${var.environment}-sg"
  vpc_id = "${data.aws_vpc.data_vpc.id}"
}

module "ec2" {
  source        = "../../modules/ec2"
  ami_id        = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  aws_region    = "${var.region}"

  availability_zone      = "${data.aws_availability_zones.available.names[0]}"
  subnet_id              = "${var.private_subnet_id}"
  number_of_instances    = "${var.count}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = "${module.sec_sg.default_sg}"
  role                   = "graphite"
  env                    = "${var.environment}"
  vpc                    = "data_vpc"

  user_data = "${path.module}/templates/graphite.tpl"
}

resource "aws_elb_attachment" "elb_attachment" {
  count    = "${var.count}"
  elb      = "${module.elb.elb_name}"
  instance = "${element(module.ec2.ec2_instance_id, count.index)}"
}

resource "aws_ebs_volume" "graphite_ebs" {
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  count             = "${var.count}"
  size              = 1000
  type              = "gp2"

  tags {
    Name = "graphite_ebs"
  }
}

resource "aws_volume_attachment" "graphite_ebs_att" {
  count       = "${var.count}"
  device_name = "/dev/xvdf"
  volume_id   = "${element(aws_ebs_volume.graphite_ebs.*.id, count.index)}"
  instance_id = "${element(module.ec2.ec2_instance_id, count.index)}"
}

data "template_file" "launch_graphite" {
  vars {
    archive_link  = "${var.archive_link}"
    playbook_name = "graphite"
    env           = "${var.environment}"
  }

  template = "${file("${path.module}/templates/graphite.tpl")}"
} // User Data or Template and Ansible Book Definition                                                                                                                                                   
