resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "develop-b" {
  name           = var.subnet_develop_b
  zone           = var.ru_central_b_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.ru_central_b_zone_cidr
}

resource "yandex_vpc_gateway" "nat_gateway" {
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  name       = "test-route-table"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family_name
}
resource "yandex_compute_instance" "platform" {
  name            = var.vm_web_name
  hostname        = var.vm_web_name
  platform_id     = var.vm_web_platform_id
  
  resources {
    cores         = var.vms_resources.web_resources.cores
    memory        = var.vms_resources.web_resources.memory
    core_fraction = var.vms_resources.web_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id  = data.yandex_compute_image.ubuntu.image_id
      size      = var.vms_resources.web_resources.hdd_size
      type      = var.vms_resources.web_resources.hdd_type

    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_public_ip
  }

  metadata = {
    serial-port-enable = var.metadata_vm.serial-port-enable
    ssh-keys           = var.metadata_vm.ssh-keys
  }

}

resource "yandex_compute_instance" "db_vm" {
  name            = local.db_name
  hostname        = var.vm_db_name
  platform_id     = var.vm_db_platform_id
  zone            = var.ru_central_b_zone
  resources {
    cores         = var.vms_resources.db_resources.cores
    memory        = var.vms_resources.db_resources.memory
    core_fraction = var.vms_resources.db_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size      = var.vms_resources.db_resources.hdd_size
      type      = var.vms_resources.db_resources.hdd_type
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-b.id
    nat       = var.vm_db_public_ip
  }

  metadata = {
    serial-port-enable = var.metadata_vm.serial-port-enable
    ssh-keys           = var.metadata_vm.ssh-keys
  }

}
