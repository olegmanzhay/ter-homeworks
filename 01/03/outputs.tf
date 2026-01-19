output "result" {
    value = "${yandex_compute_instance.dbmysql.network_interface.0.nat_ip_address}"
}