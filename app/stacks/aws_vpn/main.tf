# This is where you put your resource declaration

resource "aws_vpn_gateway" "vpn-gateway" {
  vpc_id = data.aws_vpc.vpc.id
}

resource "aws_customer_gateway" "customer-gateway" {
  bgp_asn    = var.customer-gateway-bgp-asn
  ip_address = var.customer-gateway-ip-address
  type       = var.customer-gateway-type
}

module "aws-vpn" {
  source  = "terraform-aws-modules/vpn-gateway/aws"
  version = "~> 2.0"

  vpc_id              = data.aws_vpc.vpc.id
  vpn_gateway_id      = aws_vpn_gateway.vpn-gateway.id
  customer_gateway_id = aws_customer_gateway.customer-gateway.id

  vpc_subnet_route_table_count = length(data.aws_route_tables.route-tables.ids)
  vpc_subnet_route_table_ids   = data.aws_route_tables.route-tables.ids
}