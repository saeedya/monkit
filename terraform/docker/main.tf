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