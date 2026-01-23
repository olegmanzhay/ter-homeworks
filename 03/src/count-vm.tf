
resource "yandex_compute_instance" "web"{
    depends_on = [yandex_compute_instance.db]
    count = 2
    name = "homework-3-web-${count.index+1}"
    platform_id = "standard-v3"

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
    
    scheduling_policy { preemptible = true }

    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = true
        security_group_ids = [yandex_vpc_security_group.example.id]
    }
    metadata = {
        serial-port-enable = var.metadata_vm.serial-port-enable
        ssh-keys           = var.metadata_vm.ssh-keys
    }

}