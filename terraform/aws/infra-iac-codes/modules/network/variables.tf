variable "vpc_cidr_block" {
  type = string
}

variable "network_infra_tags" {
  type = map(string)
}

variable "vpc_subnets_cidr_block" {
  type = map(any)
}