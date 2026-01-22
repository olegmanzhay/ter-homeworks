###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "b1g3a3i0fgpc8rekglrh"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "b1gpjc391srt4sq31b7b"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "ru_central_b_zone_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_family_name"{
  type        = string
  default     = "ubuntu-2004-lts"
  description = "family ubuntu for download image" 
}

variable "vm_web_name"{
  type        = string
  default     = "netology-develop-platform-web"
  description = "name of a VM"
}

variable "vm_web_platform_id"{
  type        = string
  default     = "standard-v3"
  description = "type 0f a processor"
}

# variable "vm_web_cpu"{
#   type        = number
#   default     = 2
#   description = "CPU"
# }

# variable "vm_web_ram"{
#   type        = number
#   default     = 1
#   description = "RAM"
# }

# variable "vm_web_core_fraction"{
#   type        = number
#   default     = 20
#   description = "percentage of used CPU"
# }

variable "vm_web_preemptible"{
  type        = bool
  default     = true
  description = "preemptible"
}

variable "vm_web_public_ip"{
  type        = bool
  default     = false
  description = "public ip on a VM"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCWHfL7++hHyoR6NiE9wYd8JRekX3wusetNohbkSD9OlHHRHhQair7HDEOLDH5y7ONPsblZwux+L4vEmL4SwnHo+JunY4/v7DP+GonAUClCRwFL1gbt7bEvjPFFbOKnXLYWVSLig00Wmmm7UKJjRUoEyEQdxRO5wPLskvOboz8Xt3b404RUmYCIWNV5xSs8L6i/td105ffN/r/26pwvno8R4pTHZEBbOQU3B54sVTSfUHxbAeA/bANJ/95Dc2HAyl81ev4lDAv/1UC/Z2Leu5iiKgI/lffKEJcOpXB12aC1Cvyw0iwmGTQ6VNOTkWLGDaGmh/p78bx1DVA6ds4/SUj1"
  description = "ssh-keygen -t ed25519"
}

variable "vms_resources" {
    type = map(object({
        cores         = number
        memory        = number
        core_fraction = number
        hdd_size      = number
        hdd_type      = string
    }))
    default={
        db_resources= {
            cores         = 2
            memory        = 1
            core_fraction = 20
            hdd_size      = 10
            hdd_type      ="network-hdd"
        },
        web_resources ={
            cores         = 2
            memory        = 2
            core_fraction = 20
            hdd_size      = 15
            hdd_type      ="network-hdd"
        }
    }
    description       = "resources of objects"
}

variable "metadata_vm"{
  type         = object({
    serial-port-enable  = number
    ssh-keys            = string
  })
  
  default      ={  
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCWHfL7++hHyoR6NiE9wYd8JRekX3wusetNohbkSD9OlHHRHhQair7HDEOLDH5y7ONPsblZwux+L4vEmL4SwnHo+JunY4/v7DP+GonAUClCRwFL1gbt7bEvjPFFbOKnXLYWVSLig00Wmmm7UKJjRUoEyEQdxRO5wPLskvOboz8Xt3b404RUmYCIWNV5xSs8L6i/td105ffN/r/26pwvno8R4pTHZEBbOQU3B54sVTSfUHxbAeA/bANJ/95Dc2HAyl81ev4lDAv/1UC/Z2Leu5iiKgI/lffKEJcOpXB12aC1Cvyw0iwmGTQ6VNOTkWLGDaGmh/p78bx1DVA6ds4/SUj1"
  }
  description = "metadata"
}
