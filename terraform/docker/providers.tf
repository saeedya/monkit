provider "docker" {
  registry_auth {
    address  = "http://localhost:5000"
    username = "test"
    password = "test"
  }
  host     = "ssh://ubuntu@${TF_VAR_REMOTE_IP_ADDRESS}:22"
  ssh_opts = ["-i", "../aws/infra-iac-codes/ssh.key"]
}
