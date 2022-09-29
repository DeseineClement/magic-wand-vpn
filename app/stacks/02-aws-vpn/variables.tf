# This is where you put your variables declaration

variable "vpc-id" {
  type        = string
  description = "The id of the specific VPC to retrieve."
}

variable "organization-name" {
  type        = string
  description = "Name of organization to use in private certificate."
  default     = "ACME, Inc"
}

variable "name" {
  type        = string
  description = "Name prefix for the resources of this project."
}

variable "logs-retention" {
  type        = number
  description = "Retention in days for CloudWatch Log Group"
  default     = 365
}

variable "cidr" {
  type        = any
  description = "Network CIDR to use for clients"
}

variable "split-tunnel" {
  type        = bool
  description = "With split-tunnel false, all client traffic will go through the VPN."
  default     = true
}

variable "dns-servers" {
  type        = list(string)
  description = "List of DNS Servers"
  default     = []
}

variable "self-service-portal" {
  type        = string
  description = "Specify whether to enable the self-service portal for the Client VPN endpoint"
  default     = "enabled"
}

variable "authentication-type" {
  type        = string
  description = "The type of client authentication to be used. Specify certificate-authentication to use certificate-based authentication, directory-service-authentication to use Active Directory authentication, or federated-authentication to use Federated Authentication via SAML 2.0."
  default     = "certificate-authentication"
}

variable "authentication-saml-provider-arn" {
  type        = string
  description = "The ARN of the IAM SAML identity provider if type is federated-authentication."
  default     = null
}

variable "allowed-access-groups" {
  type        = list(string)
  description = "List of Access group IDs to allow access. Leave empty to allow all groups"
  default     = []
}

variable "allowed-cidr-ranges" {
  type        = list(string)
  description = "List of CIDR ranges from which access is allowed"
  default     = []
}

variable "root-certificate-arn" {
  type        = string
  description = "The ARN of the root certificate created in ACM"
}

variable "server-certificate-arn" {
  type        = string
  description = "The ARN of the server certificate created in ACM"
}