#Через кортеж, в котором словари (map)
output "result"{
    value = [
        { web = "VM_name: ${yandex_compute_instance.platform.name}\nFQDN: ${yandex_compute_instance.platform.hostname}\npublic_ip: ${yandex_compute_instance.platform.network_interface.0.nat_ip_address}\n" },
        { db  = "VM_name: ${yandex_compute_instance.db_vm.name}\nFQDN: ${yandex_compute_instance.db_vm.hostname}\n public_ip: ${yandex_compute_instance.db_vm.network_interface.0.nat_ip_address}\n" }
    ]
}

#Через словарь (map)
output "result_web" {
    value = {
        VM_name = "${yandex_compute_instance.platform.name}", 
        FQDN = "${yandex_compute_instance.platform.hostname}", 
        public_ip = "${yandex_compute_instance.platform.network_interface.0.nat_ip_address}"
    }
    
}

#Через словарь (map)
output "result_db"{
    value = {
        VM_name = "${yandex_compute_instance.db_vm.name}",
        FQDN = "${yandex_compute_instance.db_vm.hostname}",
        public_ip = "${yandex_compute_instance.db_vm.network_interface.0.nat_ip_address}" 
    }
}