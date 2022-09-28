data "aws_vpc" "vpc" {
  id = var.vpc-id
}

data "aws_route_tables" "route-tables" {
  vpc_id = data.aws_vpc.vpc.id
}