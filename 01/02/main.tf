terraform{  
    required_providers{
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" {
  host     = "ssh://test-user@158.160.210.206:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

resource "random_password" "root_pass" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "random_password" "db_pass" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}


resource "docker_image" "mysql" {
  name = "mysql:8"
}

resource "docker_container" "database" {
  image = docker_image.mysql.image_id
  name  = "database"
  ports {
    internal = 3306
    external = 3306
  }
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.root_pass.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.db_pass.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}
