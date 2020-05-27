output "id" {
  value = aws_autoscaling_group.asg.id
}
output "name" {
  value = aws_autoscaling_group.asg.name
}
output "asg_arn" {
  value = aws_autoscaling_group.asg.arn
}
output "template_id" {
  value = aws_launch_template.template.id
}
output "template_arn" {
  value = aws_launch_template.template.arn
}