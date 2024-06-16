variable "vnet" {
  type = map(any)
}
variable "snet" {
  default = null
  type = map(object({
    name           = string
    address_prefix = string
    security_group = optional(string)
  }))
}
