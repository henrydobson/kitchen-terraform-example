output "instance_private_ips" {
  value = "${module.example.public_ip}"
}

output "vpc" {
  value = "${aws_default_vpc.default.id}"
}

output "instances" {
  value = "${module.example.id}"
}
