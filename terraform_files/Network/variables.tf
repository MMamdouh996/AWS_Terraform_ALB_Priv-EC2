variable "vpc_cidr" {
  type = string

}

variable "vpc_name" {
  type = string

}

variable "nat_subnet" {
  type = string
}
variable "route_table_in" {
  type = string
}
variable "subnet_az" {
  type = list(string)
}
variable "public-cidrs" {
  type = list(string)
}
variable "private-cidrs" {
  type = list(string)
}