variable "vm_db_family_name"{
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family ubuntu for download image" 
}

variable "vm_db_name"{
  type        = string
  default     = "netology-develop-platform-db"
  description = "name of a VM"
}

variable "vm_db_platform_id"{
  type        = string
  default     = "standard-v3"
  description = "type 0f a processor"
}

# variable "vm_db_cpu"{
#   type        = number
#   default     = 2
#   description = "CPU"
# }

# variable "vm_db_ram"{
#   type        = number
#   default     = 2
#   description = "RAM"
# }

# variable "vm_db_core_fraction"{
#   type        = number
#   default     = 20
#   description = "percentage of used CPU"
# }

variable "vm_db_preemptible"{
  type        = bool
  default     = true
  description = "preemptible"
}

variable "vm_db_public_ip"{
  type        = bool
  default     = false
  description = "public ip on a VM"
}

variable "ru_central_b_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "subnet_develop_b"{
  type        = string
  default     = "develop-b"
  description ="subnet develop-b in develop network "
}