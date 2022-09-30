# This is where you put your resource declaration

resource "aws_route53_record" "vpn-record" {
  name    = var.record-name
  type    = "CNAME"
  zone_id = data.aws_route53_zone.zone.id
  ttl     = 10

  records = ["${var.vpn-endpoint-id}.prod.clientvpn.${data.aws_region.current.name}.amazonaws.com"]
}