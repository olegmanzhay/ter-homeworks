resource "yandex_compute_disk" "hdd_disk"{
    count = 3
    name        = "hdd-disk-${count.index+1}"
    type        = "network-hdd"
    zone        = var.default_zone
    image_id    = data.yandex_compute_image.ubuntu-2204-lts.image_id
    size  = 8
}

resource "yandex_compute_instance" "storage"{
    name = "storage"
    platform_id = "standard-v3"
    zone        = var.default_zone
    hostname = "storage.ru"

    resources {
        cores         = 2
        memory        = 1
        core_fraction = 20
    }

    boot_disk {
        initialize_params {
        image_id = data.yandex_compute_image.ubuntu-2204-lts.image_id
        type     = "network-hdd"
        size     = 8
        }
    }
    dynamic "secondary_disk"{
        for_each = {for key,value in yandex_compute_disk.hdd_disk : key => value}
        content {
            disk_id = secondary_disk.value.id
        }
    } 
    scheduling_policy { preemptible = true }
    
    network_interface{
        subnet_id = yandex_vpc_subnet.develop.id
        nat = var.db_public_ip
        security_group_ids = [yandex_vpc_security_group.example.id]
    }
    metadata = {
        serial-port-enable = var.metadata_vm.serial-port-enable
        ssh-keys           = var.metadata_vm.ssh-keys
    }
}