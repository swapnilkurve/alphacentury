variable "RG" {
  type = map(any)
}
variable "SA" {
  type = map(any)
}
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

variable "keyvault" {
  type = map(any)
}
variable "KeyvaultSecret" {
  type = map(any)
}
variable "linuxvm" {
  type = map(any)
}
variable "Public_ip" {
  type = map(any)
}
variable "nsgrule" {
  type = map(any)
}
variable "loadbalancer" {
  type = map(any)
}
variable "sqlserver" {
  type = map(any)
}
variable "SQLDB" {
  type = map(any)
}