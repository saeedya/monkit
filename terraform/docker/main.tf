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

resource "docker_image" "monkit" {
  name = "monkit"
  build {
    path = "../.."
    tag  = ["localhost:5000/monkit"]
    label = {
      author : "saeedya"
    }
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