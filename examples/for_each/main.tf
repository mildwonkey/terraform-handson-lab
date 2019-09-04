resource "docker_network" "private_network" {
  name   = "example-network"
  driver = "bridge"

}

# Run some containers!
resource "docker_container" "webserver-01" {
  name  = "webserver-01"
  image = "nginx:latest"
  networks_advanced {
    name = docker_network.private_network.name
  }
}


resource "docker_container" "webserver-02" {
  name  = "webserver-02"
  image = "nginx:latest"
  networks_advanced {
    name = docker_network.private_network.name
  }
}

resource "docker_container" "appserver-01" {
  name  = "appserver-01"
  image = "ubuntu:latest"
  networks_advanced {
    name = docker_network.private_network.name
  }
}
resource "docker_container" "appserver-02" {
  name  = "appserver-02"
  image = "ubuntu:latest"
  networks_advanced {
    name = docker_network.private_network.name
  }
}
resource "docker_container" "appserver-03" {
  name  = "appserver-03"
  image = "ubuntu:latest"
  networks_advanced {
    name = docker_network.private_network.name
  }
}

resource "docker_container" "db-01" {
  name  = "db-01"
  image = "mysql:latest"
  env = [
    "MYSQL_RANDOM_ROOT_PASSWORD=yes"
  ]
  networks_advanced {
    name = docker_network.private_network.name
  }
}
