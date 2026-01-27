resource "yandex_compute_instance" "db"{
    for_each = {for key,value in var.each_vm : key => value}
    name = each.value.vm_name
    platform_id = var.db_platform_id
    zone = var.default_zone
    hostname = "${each.value.vm_name}.ru"
    
    boot_disk{
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu-2204-lts.image_id
            type     = var.db_disk_type
            size     = each.value.disk_volume
        }
    }
    resources{
        cores = each.value.cpu
        memory = each.value.ram
        core_fraction = 20
    }

    scheduling_policy { preemptible = true }
    
    network_interface{
        subnet_id = yandex_vpc_subnet.develop.id
        nat = var.db_public_ip
        security_group_ids = [yandex_vpc_security_group.example.id]
    }
    metadata = {
        serial-port-enable = var.metadata_vm.serial-port-enable
        ssh-keys           = local.ssh-keys
    }
}