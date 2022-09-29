resource "aws_security_group" "security-group" {
  name_prefix = "${var.name}-Client-VPN"
  description = "security group allowing egress for client-vpn users"
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    Name               = "${var.name}-Client-VPN"
    EnvName            = var.name
    Service            = "client-vpn"
    TerraformWorkspace = terraform.workspace
  }
}

resource "aws_security_group_rule" "security-group-egress" {
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.security-group.id
}