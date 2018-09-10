#================================================
# Authentication to AWS

# Insert Backend!

# Insert AWS Provider!

resource "aws_default_vpc" "default" {
    tags {
        Name = "Default VPC"
    }
}

resource "aws_default_security_group" "default" {
  vpc_id = "${aws_default_vpc.default.id}"

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
}

data "aws_subnet_ids" "default" {
  vpc_id = "${aws_default_vpc.default.id}"
}

# data "aws_security_group" "selected" {
#   filter {
#     name   = "group-name"
#     values = ["default"]
#   }
# }

module "ssh_key_pair" {
  source                = "git::https://github.com/cloudposse/terraform-aws-key-pair.git?ref=master"
  namespace             = "cp"
  stage                 = "prod"
  name                  = "app"
  ssh_public_key_path   = "secrets"
  generate_ssh_key      = "true"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
  chmod_command         = "chmod 600 %v"
}

module "example_labels" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"
  namespace  = "kitchen"
  stage      = "prod"
  name       = "example"
  attributes = []
  delimiter  = "-"
  tags       = {}
}

module "example" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "${module.example_labels.id}"
  instance_count = 1

  ami                    = "ami-ee6a718a"
  instance_type          = "t2.micro"
  key_name               = "${module.ssh_key_pair.key_name}"
  monitoring             = true
  vpc_security_group_ids = ["${aws_default_security_group.default.id}"]
  subnet_id              = "${data.aws_subnet_ids.default.ids[0]}"
  associate_public_ip_address = true
  tags = "${merge(map("ShutDownPolicy", "uk-office-hours"), module.example_labels.tags)}"
}
