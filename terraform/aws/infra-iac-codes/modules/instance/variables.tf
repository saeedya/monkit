variable "instance_name" {
  type = string
}

variable "instance_ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_key_name" {
  type = string
}

variable "instance_associate_public_ip_address" {
  type = bool
}

variable "instance_security_groups" {
  type = list(any)
}

variable "instance_subnet_id" {
  type = string
}