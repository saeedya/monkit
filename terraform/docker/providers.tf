provider "docker" {
  registry_auth {
    address  = "http://localhost:5000"
    username = "test"
    password = "test"
  }
  host     = "ssh://ubuntu@instanc1:22"
  ssh_opts = ["-i", "../aws/infra-iac-codes/ssh.key"]
}
