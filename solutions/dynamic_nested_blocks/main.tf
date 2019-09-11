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

  dynamic "ports" {
    // the "docker_ports" variable is defined in variables.tf
    for_each = var.docker_ports
    content {
      internal = ports.value.internal
      external = ports.value.external
      protocol = ports.value.protocol
    }
  }
}
