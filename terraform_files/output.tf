# public-instance-1-public_ip = "54.162.248.123"
output "public-instance-1-public_ip" {
  value = module.public_ec2_1.public_ip
}

# public-instance-2-public_ip = "44.203.46.237"
output "public-instance-2-public_ip" {
  value = module.public_ec2_2.public_ip
}
output "lb-arn" {
  value = module.proxy_alb.lb-dns
}

#private-instance-1-private_ip = "10.1.2.12"
output "private-instance-1-private_ip" {
  value = module.private_ec2_1.private_ip
}

#private-instance-2-private_ip = "10.1.3.13"
output "private-instance-2-private_ip" {
  value = module.private_ec2_2.private_ip
}

# public-instance-1-private_ip = "54.162.248.123"
output "public-instance-1-private_ip" {
  value = module.public_ec2_1.private_ip
}

#public-instance-2-private_ip = "44.203.46.237"
output "public-instance-2-private_ip" {
  value = module.public_ec2_2.private_ip
}
