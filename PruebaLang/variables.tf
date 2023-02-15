variable "region" {
  description = "The region the environment is going to be installed into"
  type        = string
  default     = "eu-west-1"
}

variable "domain_name" {
  default = "langstoretest.com"
}

variable "alternative_domain_name" {
  default = "*.langstoretest.com"
}