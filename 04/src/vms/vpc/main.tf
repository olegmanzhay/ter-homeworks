#создаем облачную сеть
resource "yandex_vpc_network" "network" {
  name = var.network_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "subnet" {
  name           = var.subnet_name
  zone           = var.subnet_zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = var.v4_cidr_blocks
}

# resource "yandex_vpc_subnet" "develop_b" {
#   name           = "develop-ru-central1-b"
#   zone           = "ru-central1-b"
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = ["10.0.2.0/24"]
# }