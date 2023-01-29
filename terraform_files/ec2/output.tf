output "instance-id" {
  value = aws_instance.public-ec2-x.id
}
output "public_ip" {
  value = aws_instance.public-ec2-x.public_ip
}
output "private_ip" {
  value = aws_instance.public-ec2-x.private_ip
}