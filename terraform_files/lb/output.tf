output "lb-dns" {
  value = aws_alb.alb-x.dns_name
}
output "TG_arn" {
  value = aws_alb_target_group.lb_target_group.arn
}