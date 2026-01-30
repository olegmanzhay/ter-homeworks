output "network_id" {
  value = yandex_vpc_network.mynet.id
}

output "subnet_ids" {
  value = values(yandex_vpc_subnet.subnet)[*].id
}

output "mysql_sg_id" {
  description = "ID security group for MySQL"
  value       = yandex_vpc_security_group.mysql-sg.id
}