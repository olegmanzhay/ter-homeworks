output "vpc_id" {
  description = "ID созданной VPC-сети"
  value       = yandex_vpc_network.develop.id
}

output "subnet_ids" {
  description = "Карта ID подсетей по их именам"
  value = {
    for subnet in yandex_vpc_subnet.subnets :
      subnet.name => subnet.id  # берём поля напрямую
  }
}


output "security_group_id" {
  description = "ID группы безопасности"
  value       = yandex_vpc_security_group.example.id
}

output "subnet_zones" {
  description = "Карта зон подсетей по их именам"
  value = {
    for name, subnet in yandex_vpc_subnet.subnets :
    name => subnet.zone
  }
}