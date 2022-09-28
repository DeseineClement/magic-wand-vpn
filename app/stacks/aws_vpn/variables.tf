# This is where you put your variables declaration

variable "vpc-id" {
  type        = string
  description = "The id of the specific VPC to retrieve."
}

variable "customer-gateway-bgp-asn" {
  type        = number
  description = "The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)."
  default     = 65000
}

variable "customer-gateway-type" {
  type        = string
  description = "The type of customer gateway. The only type AWS supports at this time is ipsec.1."
  default     = "ipsec.1"
}

variable "customer-gateway-ip-address" {
  type        = string
  description = "The IP address of the gateway's Internet-routable external interface."
}