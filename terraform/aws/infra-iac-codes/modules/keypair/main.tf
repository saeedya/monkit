resource "tls_private_key" "my_ssh_key_pair" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "my_aws_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.my_ssh_key_pair.public_key_openssh
}

resource "local_file" "ssh_key_file" {
  filename        = "ssh.key"
  content         = tls_private_key.my_ssh_key_pair.private_key_openssh
  file_permission = "0600"
}