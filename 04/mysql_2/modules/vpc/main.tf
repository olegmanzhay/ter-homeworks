resource "yandex_vpc_network" "mynet" {
  name = var.network_name
}

resource "yandex_vpc_security_group" "mysql-sg" {
  name       = var.security_group_name
  network_id = yandex_vpc_network.mynet.id

  ingress {
    description    = "MySQL®"
    port           = 3306
    protocol       = "TCP"
    v4_cidr_blocks = [ "0.0.0.0/0" ]
  }
}

resource "yandex_vpc_subnet" "subnet" {
    for_each = {for key, value in var.subnets : key => value}

    name             = each.value.name
    zone             = each.value.zone
    network_id       = yandex_vpc_network.mynet.id
    v4_cidr_blocks   = each.value.cidr
}