output "network_id" {
  value = yandex_vpc_network.network.id
}

output "subnet_ids" {
  value = values(yandex_vpc_subnet.subnet)[*].id
}