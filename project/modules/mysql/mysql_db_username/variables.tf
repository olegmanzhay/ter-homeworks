###cloud vars

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
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "cluster_id" {
  type        = string
}

variable "db_name" {
  type        = string
}

variable "user_name" {
  type        = string
}

variable "user_password" {
  type        = string
}

