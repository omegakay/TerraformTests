variable "region" {
  description = "The region the environment is going to be installed into"
  type        = string
  default     = "eu-west-1"
}

variable "domain_name" {
  default = "storelangprueba1.com"
}

variable "alternative_domain_name" {
  default = "*.storelangprueba1.com"
}

variable "container_img" {
  default = "public.ecr.aws/e7u8c7i6/pruebalang.ai:latest"
}