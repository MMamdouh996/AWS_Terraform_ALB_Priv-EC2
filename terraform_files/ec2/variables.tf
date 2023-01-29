variable "ec2_ami" {
  
}
variable "ec2_type" {
  
}
variable "SG_id" {
  type = list(string)
}

variable "instance_name" {
  type = string
  
}
variable "ec2_subnet" {
  type = string
}
variable "pub_ip_state" {
  type = string
  
}
variable "key_pair" {
  type = string
  
}
variable "proxy_pass_url" {
  
}
variable "proxy_existance" {
  
}
variable "bastion_host_ip" {
  
}
variable "remote-commands" {
  
}
variable "instnace-number" {
  
}