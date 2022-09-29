resource "aws_cloudwatch_log_group" "vpn" {
  name              = "/aws/vpn/${var.name}/logs"
  retention_in_days = var.logs-retention

  tags = tomap({
    "Name"    = "${var.name}-Client-VPN-Log-Group",
    "EnvName" = var.name
  })
}

resource "aws_cloudwatch_log_stream" "vpn" {
  name           = "vpn-usage"
  log_group_name = aws_cloudwatch_log_group.vpn.name
}