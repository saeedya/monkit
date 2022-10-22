# Create a registry container
resource "docker_container" "registry_container" {
  image        = docker_image.registry_image.name
  name         = "registry"
  attach       = false
  network_mode = "host"
  restart      = "always"
  volumes {
    host_path      = "/registry/data"
    container_path = "/var/lib/registry"
  }
}

# Pulls the registry image
resource "docker_image" "registry_image" {
  name = "registry:2"
}

# Build and push monkit image into remote server
resource "docker_registry_image" "monkit" {
  provider             = docker
  name                 = "localhost:5000/monkit"
  insecure_skip_verify = true
  keep_remotely        = true

  build {
    auth_config {
      host_name = "localhost"
      user_name = "test"
      password  = "test"
      auth      = "test"
    }
    network_mode = host
    context    = "../.."
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "monkit_image" {
  name = "localhost:5000/monkit:latest"
}

# Create monkit container and published on port 8000
resource "docker_container" "monkit_container" {
  provider     = docker
  image        = docker_image.monkit_image.name
  name         = "monkit"
  attach       = false
  network_mode = "host"
  ports {
    internal = 8000
    external = 8000
  }
}