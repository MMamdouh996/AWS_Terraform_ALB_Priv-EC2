
resource "aws_alb" "alb-x" {
  name               = var.lb_name
  internal           = var.lb_internal_or_not
  security_groups    = [var.lb-SGG]
  subnets            = var.lb_subnets_ids
}

resource "aws_alb_listener" "lb_listener" {
  load_balancer_arn = aws_alb.alb-x.arn
  port             = "80"
  protocol         = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.lb_target_group.arn
    type             = "forward"
  }
}

resource "aws_alb_target_group" "lb_target_group" {
  name       = var.target_group_name
  port       = 80
  protocol   = "HTTP"
  vpc_id     = var.vpc_id
  target_type = var.target_group_type
}

resource "aws_alb_target_group_attachment" "attach_target_group" {
  target_group_arn = aws_alb_target_group.lb_target_group.arn
#   target_id = join(",", var.ec2s_instance_ids)
  count = length(flatten(var.ec2s_instance_ids))
  # target_id = element(var.ec2_instance_ids, count.index)
  target_id = flatten(var.ec2s_instance_ids)[count.index]
  port = 80
}
