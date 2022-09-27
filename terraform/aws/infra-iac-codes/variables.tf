variable "aws_ssh_key_pair" {
  default = "mykey"
}

variable "network_infra_tags" {
  default = {
    "Name"  = "task1"
    "Scope" = "non-prod"
  }
}

variable "vpc_cidr_block" {
  default = "10.10.0.0/16"
}

variable "vpc_subnets_cidr_block" {
  default = {
    "az1" = {
      "cidr_block"             = "10.10.1.0/24"
      "availability_zone_name" = "us-east-1a"
      "allow_public_ip"        = true
    },
    "az2" = {
      "cidr_block"             = "10.10.2.0/24"
      "availability_zone_name" = "us-east-1b"
      "allow_public_ip"        = true
    },
    "az3" = {
      "cidr_block"             = "10.10.3.0/24"
      "availability_zone_name" = "us-east-1c"
      "allow_public_ip"        = true
    },
  }
}

variable "ec2_instances" {
  default = {
    "instance1" = {
      "name"          = "instance1"
      "ami"           = "ami-08c40ec9ead489470"
      "type"          = "t2.micro"
      "set_public_ip" = true
    }
  }
}