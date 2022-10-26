# Start a container
resource "docker_container" "registry" {
  name  = "registry"
  image = docker_image.registry.image_id
  ports {
    internal = 5000
    external = 5000
  }
  volumes {
    host_path      = "/registry/data"
    container_path = "/var/lib/registry"
  }
}

resource "docker_image" "registry" {
  name = "registry:2"
}

# Build and push monkit image into remote server
resource "docker_registry_image" "monkit" {
  provider             = docker
  name                 = "monkit"
  insecure_skip_verify = true

  build {
    auth_config {
      host_name = "localhost:5000"
      user_name = "test"
      password  = "test"
      auth      = "test"
    }
    context    = "../.."
    dockerfile = "Dockerfile"
  }
}