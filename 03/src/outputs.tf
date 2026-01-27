output "result" {
  value = concat([
        for server in yandex_compute_instance.db :
        {
            name = server.name
            fqdn = server.hostname
            id = server.id
        }
    ],
    [
        for server in yandex_compute_instance.web :
        {
            name = server.name
            fqdn = server.hostname
            id = server.id
        }
  ])
}