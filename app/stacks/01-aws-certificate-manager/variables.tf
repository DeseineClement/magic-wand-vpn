# This is where you put your variables declaration

variable "organization-name" {
  type        = string
  description = "Name of organization to use in private certificate."
  default     = "ACME, Inc"
}

variable "name" {
  type        = string
  description = "Name prefix for the resources of this project."
}