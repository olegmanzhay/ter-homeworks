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


###VPC vars

variable "vpc_name" {
  type        = string
  default = "develop"
  description = "Name of a network"
}

variable "subnet_develop_a{
  type        = string
  default     = "develop-a"
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "subnet_develop_b {
  type        = string
  default     = "develop-b"
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "ru_central_a_zone" {
  type        = string
  default = "ru-central1-a"
  description = ""
}

variable "ru_central_b_zone" {
  type        = string
  default = "ru-central1-b"
  description = ""
}

variable "ru_central_a_zone_cidr {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "ru_central_b_zone_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###Security vars
variable "security_group_ingress" {
  description = "secrules ingress"
  type = list(object(
    {
      protocol       = string
      description    = string
      v4_cidr_blocks = list(string)
      port           = optional(number)
      from_port      = optional(number)
      to_port        = optional(number)
  }))
  default = [
    {
      protocol       = "TCP"
      description    = "разрешить входящий ssh"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 22
    },
    {
      protocol       = "TCP"
      description    = "разрешить входящий  http"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 80
    },
    {
      protocol       = "TCP"
      description    = "разрешить входящий https"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 443
    },
  ]
}


variable "security_group_egress" {
  description = "secrules egress"
  type = list(object(
    {
      protocol       = string
      description    = string
      v4_cidr_blocks = list(string)
      port           = optional(number)
      from_port      = optional(number)
      to_port        = optional(number)
  }))
  default = [
    { 
      protocol       = "TCP"
      description    = "разрешить весь исходящий трафик"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 0
      to_port        = 65365
    }
  ]
}
