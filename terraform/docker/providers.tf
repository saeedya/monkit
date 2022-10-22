data "template_file" "remote_ip_address" {
  template = "${file("/tmp/remote_ip_address.txt")}"
}

provider "docker" {
  registry_auth {
    address  = "http://localhost:5000"
    username = "test"
    password = "test"
  }
  host     = "ssh://ubuntu@${data.template_file.remote_ip_address}:22"
  ssh_opts = ["-i", "../aws/infra-iac-codes/ssh.key"]
}
