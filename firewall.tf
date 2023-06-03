resource "aws_security_group" "helloworld" {
  name        = "helloworld_firewall"
  description = "Limit access to/from helloworld project instances"
  vpc_id      = data.aws_vpc.default.id
}

resource "aws_vpc_security_group_ingress_rule" "helloworld_ingress_unique_source_ip" {
  security_group_id = aws_security_group.helloworld.id
  cidr_ipv4         = var.bastion_ip
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "helloworld_egress_all" {
  security_group_id = aws_security_group.helloworld.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
