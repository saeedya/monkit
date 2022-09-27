output "instances_public_ip" {
  value = {
    for k, v in module.ec2_instances : k => v.instance_public_ip
  }
}