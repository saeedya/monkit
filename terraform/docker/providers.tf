data "template_file" "remote_ip_address" {
  template = "${file("/tmp/remote_ip_address.json")}"
}

provider "docker" {
  registry_auth {
    address  = "http://127.0.0.1:5000"
    username = "test"
    password = "test"
  }
  host     = "ssh://ubuntu@${data.template_file.remote_ip_address.rendered}:22"
  ssh_opts = ["-i", "../aws/infra-iac-codes/ssh.key"]
}
