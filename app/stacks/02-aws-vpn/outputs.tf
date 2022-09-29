# This is where you put your outputs declaration

output "vpn-endpoint-dns-name" {
  value = aws_ec2_client_vpn_endpoint.vpn-endpoint.dns_name
}