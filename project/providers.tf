terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.12.0"
}

provider "yandex" {
  # token     = var.token
  service_account_key_file = file("~/.authorized_key_terraform.json")
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.ru_central_a_zone
}