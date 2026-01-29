#создаем облачную сеть
resource "yandex_vpc_network" "network" {
  name = var.network_name
}

#создаем подсеть
resource "yandex_vpc_subnet" "subnet" {
  for_each = {for key, value in var.subnets : key => value}

  name           = each.value.name
  zone           = each.value.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = each.value.cidr
}

# resource "yandex_vpc_subnet" "develop_b" {
#   name           = "develop-ru-central1-b"
#   zone           = "ru-central1-b"
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = ["10.0.2.0/24"]
# }