output "network_id" {
  value = yandex_vpc_network.network.id
  description = "ID созданной сети"
}

output "subnet_id" {
  value = yandex_vpc_subnet.subnet.id
  description = "ID созданной подсети"
}