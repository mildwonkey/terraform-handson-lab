resource "docker_network" "private_network" {
  name   = "example-network"
  driver = "bridge"
}

# Run some containers!
resource "docker_container" "myapp" {
  for_each = var.containers
  name     = each.key
  image    = each.value.image
  networks_advanced {
    name = docker_network.private_network.name
  }
  env = each.value.env
}

