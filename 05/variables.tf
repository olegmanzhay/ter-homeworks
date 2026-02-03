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
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]

  validation {
    condition = alltrue([
      for ip in var.ip_list : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "Все элементы списка должны быть корректными IPv4‑адресами."
  }
}

variable "lowercase_string" {
  type        = string
  description = "Любая строка (только строчные буквы)"
  default     = "пример строки без заглавных букв"

  validation {
    condition     = length(regexall("[A-Z]", var.lowercase_string)) == 0
    error_message = "Строка не должна содержать символов верхнего регистра."
  }
}

variable "in_the_end_there_can_be_only_one" {
  description = "Who is better Connor or Duncan?"
  type = object({
    Duncan = optional(bool)
    Connor = optional(bool)
  })
  default = {
    Duncan = true
    Connor = true
  }

  validation {
    condition = (
      (var.in_the_end_there_can_be_only_one.Duncan == true && var.in_the_end_there_can_be_only_one.Connor == false) ||
      (var.in_the_end_there_can_be_only_one.Duncan == false && var.in_the_end_there_can_be_only_one.Connor == true)
    )
    error_message = "There can be only one MacLeod"
  }
}