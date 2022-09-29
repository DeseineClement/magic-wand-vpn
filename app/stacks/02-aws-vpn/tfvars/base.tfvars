organization-name       = <%= output("00-common.organization-name") %>
name                    = <%= output("00-common.name") %>
root-certificate-arn    = <%= output("01-aws-certificate-manager.root-certificate-arn") %>
server-certificate-arn  = <%= output("01-aws-certificate-manager.server-certificate-arn") %>
cidr                    = "10.0.0.0/16"
self-service-portal     = "disabled"