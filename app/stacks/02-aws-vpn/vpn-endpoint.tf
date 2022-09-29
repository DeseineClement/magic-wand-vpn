resource "aws_ec2_client_vpn_endpoint" "vpn-endpoint" {
  description            = "${var.name}-Client-VPN"
  server_certificate_arn = var.server-certificate-arn
  client_cidr_block      = var.cidr
  split_tunnel           = var.split-tunnel
  dns_servers            = var.dns-servers
  self_service_portal    = var.self-service-portal
  security_group_ids     = [aws_security_group.security-group.id]
  vpc_id                 = data.aws_vpc.vpc.id

  authentication_options {
    type                       = var.authentication-type
    root_certificate_chain_arn = var.authentication-type != "certificate-authentication" ? null : var.root-certificate-arn
    saml_provider_arn          = var.authentication-saml-provider-arn
  }

  connection_log_options {
    enabled               = true
    cloudwatch_log_group  = aws_cloudwatch_log_group.vpn.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.vpn.name
  }

  tags = tomap({
    "Name"    = "${var.name}-Client-VPN",
    "EnvName" = var.name
  })
}

resource "aws_ec2_client_vpn_network_association" "network-association" {
  count                  = length(data.aws_subnets.subnets.ids)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn-endpoint.id
  subnet_id              = data.aws_subnets.subnets.ids[count.index]
}

resource "aws_ec2_client_vpn_authorization_rule" "all-groups" {
  count                  = length(var.allowed-access-groups) > 0 ? 0 : length(var.allowed-cidr-ranges)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn-endpoint.id
  target_network_cidr    = var.allowed-cidr-ranges[count.index]
  authorize_all_groups   = true
}

resource "aws_ec2_client_vpn_authorization_rule" "specific-groups" {
  count                  = length(var.allowed-access-groups) * length(var.allowed-cidr-ranges)
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.vpn-endpoint.id
  target_network_cidr    = var.allowed-cidr-ranges[count.index]
  access_group_id        = var.allowed-access-groups[count.index % length(var.allowed-cidr-ranges)]
}