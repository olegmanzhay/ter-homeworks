variable "each_vm" {
    type = list(
        object(
            {   vm_name=string,
                cpu=number,
                ram=number,
                disk_volume=number 
            }))
}

variable "db_platform_id"{
    type        = string
    description = "type of a processor on a VM"
}

variable "db_disk_type"{
    type        = string
    description = "type of disk"
}

variable "db_public_ip"{
    type        = bool
    description = "using of a public ip"
}