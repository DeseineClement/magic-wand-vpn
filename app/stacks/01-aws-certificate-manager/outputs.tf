# This is where you put your outputs declaration

output "ca-certificate-arn" {
  value = aws_acm_certificate.ca.arn
}

output "root-certificate-arn" {
  value = aws_acm_certificate.root.arn
}

output "server-certificate-arn" {
  value = aws_acm_certificate.server.arn
}
