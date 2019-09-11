variable "containers" {
  type = map(object({
    image = string
    env   = list(string)
  }))

  default = {
    "webserver-01" = {
      image = "nginx:latest"
      env   = []
    },
    "webserver-02" = {
      image = "nginx:latest"
      env   = []
    },
    "appserver-01" = {
      image = "ubuntu:latest"
      env   = []
    },
    "appserver-02" = {
      image = "ubuntu:latest"
      env   = []
    },
    "appserver-03" = {
      image = "ubuntu:latest"
      env   = []
    },
    "db-01" = {
      image = "mysql:latest"
      env = [
        "MYSQL_RANDOM_ROOT_PASSWORD=yes"
      ]
    }
  }
}
