#common_variables
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
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}



#for cluster

variable "network_id" {
  type        = string
  description = "Network id"
}

variable "version_mysql" {
  type        = string
  description = "varsion mysql"
}

variable "cluster_name" {
  type        = string
  description = "Name of a cluster"
}

variable "security_group_id" {
  type        = string
  description = "Группа безопасности"
}

variable "ha" {
  type        = bool
  default     = true
  description = "high avaliability"
}


variable hosts{
  type    = list(object({
      subnet_id = string
      zone = string
      nat = bool
  }))
  description = "hosts"
}

