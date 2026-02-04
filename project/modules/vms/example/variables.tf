###cloud vars
variable "token" {
  type        = string
  default = "~/.authorized_key_terraform.json"
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default = "b1g3a3i0fgpc8rekglrh"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1gpjc391srt4sq31b7b"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default = "ru-central1-a"
  description = "https://yandex.cloud/ru/docs/overview/concepts/geo-scope"
}


###for VM

variable "vm_configs" {
  description = "Конфигурация виртуальных машин"
  type = list(object({
    name = string

    # Ресурсы ВМ
    cpu           = number
    ram           = number
    core_fraction = optional(number, 20)   # дефолт: 20%
    platform_id   = optional(string, "standard-v3")  # дефолт

    # Диск
    disk = object({
      image_id = any                   # ID образа или family
      type     = string                   # "network-hdd", "network-ssd" и т.п.
      size     = number                   # в ГБ
    })

    preemptible = optional(bool, false)   # дефолт: false

    # Сеть
    network = object({
      subnet_id         = string
      nat               = bool
      security_group_ids = list(string)
    })

    # Metadata
    metadata = optional(object({
      serial_port_enable = bool
      ssh_keys           = string
    }))
  }))

  default = []
}
