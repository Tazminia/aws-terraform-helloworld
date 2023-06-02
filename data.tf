data "aws_ami" "ubuntu_20" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = [local.canonical_ami_owner_id]
}

data "aws_vpc" "default" {
  default = true
}
