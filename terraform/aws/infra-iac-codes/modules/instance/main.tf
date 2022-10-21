resource "aws_instance" "my_instance" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.instance_key_name
  associate_public_ip_address = var.instance_associate_public_ip_address
  subnet_id                   = var.instance_subnet_id
  security_groups             = var.instance_security_groups
  ebs_block_device {
        device_name = "/dev/xvdba"
        volume_size = "10"
        volume_type = "gp3"
        tags = {
            "FileSystem" : "/test/data"
        }
    }
  tags = {
    name = var.instance_name
  }
}

resource "local_file" "inventory" {
  filename = "../../../ansible/inventory.ini"
  content     = <<EOF
  [all]
  ${aws_instance.my_instance.public_ip}
  [all:vars]
  ansible_user=ubuntu
  ansible_ssh_private_key_file="../terraform/aws/infra-iac-codes/ssh.key"
  EOF
}