resource "yandex_vpc_network" "develop" {
  name = "develop"
}

resource "yandex_vpc_subnet" "develop-a" {
    name            = "develop-subnet-ru-central-a"
    network_id      = yandex_vpc_network.develop.id
    zone            = "ru-central1-a" 
    v4_cidr_blocks  = ["192.168.0.0/24"]
}

resource "yandex_vpc_subnet" "develop-b" {
    name            = "develop-subnet-ru-central-b"
    network_id      = yandex_vpc_network.develop.id
    zone            = "ru-central1-b" 
    v4_cidr_blocks  = ["192.168.1.0/24"]
}