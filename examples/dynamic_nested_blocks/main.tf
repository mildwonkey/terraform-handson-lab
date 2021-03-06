# Find the latest consul image.
data "docker_registry_image" "consul" {
  name = "consul"
}

resource "docker_image" "consul" {
  name          = data.docker_registry_image.consul.name
  pull_triggers = [data.docker_registry_image.consul.sha256_digest]
}

# Start a container
resource "docker_container" "consul" {
  name     = "consul"
  hostname = "consul"
  image    = docker_image.consul.latest

  ports {
    internal = 8300
    external = 8300
    protocol = "tcp"
  }

  ports {
    internal = 8301
    external = 8301
    protocol = "tcp"
  }

  ports {
    internal = 8301
    external = 8301
    protocol = "udp"
  }

  ports {
    internal = 8302
    external = 8302
    protocol = "tcp"
  }

  ports {
    internal = 8302
    external = 8302
    protocol = "upd"
  }

  ports {
    internal = 8400
    external = 8400
    protocol = "tcp"
  }
  ports {
    internal = 8500
    external = 8500
    protocol = "tcp"
  }

  ports {
    internal = 8600
    external = 8600
    protocol = "tcp"
  }

  ports {
    internal = 8600
    external = 53
    protocol = "udp"
  }
}
