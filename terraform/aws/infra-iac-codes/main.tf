module "infra_network" {
  source                 = "./modules/network"
  vpc_cidr_block         = var.vpc_cidr_block
  network_infra_tags     = var.network_infra_tags
  vpc_subnets_cidr_block = var.vpc_subnets_cidr_block
}

module "key" {
  source   = "./modules/keypair"
  key_name = var.aws_ssh_key_pair
}

resource "random_integer" "random_subnet_index" {
  min = 0
  max = length(module.infra_network.vpc_subnet_ids) - 1
}

module "ec2_instances" {
  for_each                             = var.ec2_instances
  source                               = "./modules/instance"
  instance_name                        = each.value.name
  instance_ami                         = each.value.ami
  instance_type                        = each.value.type
  instance_key_name                    = var.aws_ssh_key_pair
  instance_associate_public_ip_address = each.value.set_public_ip
  instance_security_groups             = [module.infra_network.vpc_default_security_group]
  instance_subnet_id                   = element(module.infra_network.vpc_subnet_ids, random_integer.random_subnet_index.result)
}