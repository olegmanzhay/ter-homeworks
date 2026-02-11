resource "yandex_compute_instance" "vm" {
  for_each = { for vm in var.vm_configs : vm.name => vm }


  name        = each.value.name

  platform_id = each.value.platform_id
  zone = each.value.zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = each.value.disk.image_id
      type     = each.value.disk.type
      size     = each.value.disk.size
    }
  }

  scheduling_policy {
    preemptible = each.value.preemptible
  }

  network_interface {
    subnet_id          = each.value.network.subnet_id
    nat                = each.value.network.nat
    security_group_ids = each.value.network.security_group_ids
  }

  metadata = {
    for key, value in each.value.metadata : key => value
  }
  
}


