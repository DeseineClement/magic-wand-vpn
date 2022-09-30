# This is where you put your variables declaration

variable "zone-id" {
  type        = string
  description = "Hosted Zone id of the desired Hosted Zone."
}

variable "record-name" {
  type        = string
  description = "DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone."
}

variable "vpn-endpoint-id" {
  type        = string
  description = "The id of the VPN endpoint created"
}
