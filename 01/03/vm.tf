
# Получение списка образов из семейства ubuntu-2204-lts
data "yandex_compute_image" "ubuntu-2204-lts" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "dbmysql"{
    name            ="dev-myapp-db-mysql"
    hostname        ="dev-myapp-db-mysql"
    platform_id     ="standard-v3"

    zone = "ru-central1-a"
    
    # инициализация ресурсов для ВМ
    resources{
        cores         = 2
        memory        = 1
        core_fraction = 20 #процент использования ядер
    }

    # инициализация образа для ВМ
    boot_disk{
        initialize_params{
            image_id = data.yandex_compute_image.ubuntu-2204-lts.image_id
            type     = "network-hdd"
            size     = 10
        }
    }

    scheduling_policy{
        preemptible = true
    }

    network_interface{
        subnet_id = yandex_vpc_subnet.develop-a.id
        nat = true
    }

    # Это map
    metadata = {
        ssh-keys = "ubuntu:${file("~/.ssh/ssh-key-15-12-25.pub")}"
    }

}