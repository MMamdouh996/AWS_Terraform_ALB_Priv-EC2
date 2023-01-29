output "vpc-id" {
  value = aws_vpc.vpc-x.id
}
output "public-subnet-az1-id" {
  value = aws_subnet.public-subnet[0].id
}
output "public-subnet-az2-id" {
  value = aws_subnet.public-subnet[1].id
}
output "private-subnet-az1-id" {
  value = aws_subnet.private-subnet[0].id
}
output "private-subnet-az2-id" {
  value = aws_subnet.private-subnet[1].id
}