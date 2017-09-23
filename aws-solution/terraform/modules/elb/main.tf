resource "aws_elb" "elb" {
    name = "${var.name}"
    //availability_zones = ["${split(",", var.availability_zones)}"]
    //availability_zones = ["${var.availability_zones}"]
    security_groups = ["${var.security_groups}"]
    subnets = ["${var.subnets}"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 443
    lb_protocol = "https"
    ssl_certificate_id = "${var.ssl_certificate_id}"
}

  listener {
    instance_port = 8080
    instance_protocol = "http"
    lb_port = 8080
    lb_protocol = "http"
}

  listener {
    instance_port = 8081
    instance_protocol = "http"
    lb_port = 8081
    lb_protocol = "http"
}

    health_check {
    healthy_threshold = 2
    unhealthy_threshold = 5
    timeout = 30
    //target = "TCP:${var.health_check_port}"
    target = "TCP:80"
    interval = 45
    }


//  instances = ["${var.instances}"]
    cross_zone_load_balancing = true
    idle_timeout = 400
    connection_draining = true
    connection_draining_timeout = 400

  tags {
    key                 = "Name"
    value               = "${var.name}"
    propagate_at_launch = true
  }


}
