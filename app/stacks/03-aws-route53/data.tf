data "aws_route53_zone" "zone" {
  zone_id = var.zone-id
}

data "aws_region" "current" {}