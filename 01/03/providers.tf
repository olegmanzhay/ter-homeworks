terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  cloud_id = "b1g3a3i0fgpc8rekglrh"
  folder_id = "b1gpjc391srt4sq31b7b"
  service_account_key_file = file("~/.authorized_key_terraform.json")
}