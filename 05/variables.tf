variable "ip_address" {
  type        = string
  description = "IP‑адрес"
  default     = "192.168.0.1"


  validation {
    condition     = can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.ip_address))
    error_message = "Значение должно быть корректным IPv4‑адресом (например, 192.168.0.1)."
  }
}

variable "ip_list" {
  type        = list(string)
  description = "Список IP‑адресов"
  default     = ["192.1680.0.1", "01.1.1.1", "127.0.0.1"]

  validation {
    condition = alltrue([
      for ip in var.ip_list : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "Все элементы списка должны быть корректными IPv4‑адресами."
  }
}