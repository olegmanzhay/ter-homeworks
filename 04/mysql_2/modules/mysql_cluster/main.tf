resource "yandex_mdb_mysql_cluster" "my-mysql" {
  name                = var.cluster_name
  environment         = "PRESTABLE"
  network_id          = var.network_id
  version             = var.version_mysql
  security_group_ids  = [var.security_group_id]

  # Настройки ресурсов (минимальные)
  resources {
    resource_preset_id = "s2.micro"
    disk_type_id       = "network-hdd"
    disk_size          = 10
  }

  dynamic "host" {
        for_each = var.ha ? var.hosts : slice(var.hosts, 0, 1)
        content {
          zone             = host.value.zone
          subnet_id        = host.value.subnet_id
          assign_public_ip = host.value.nat
        }
  }
}