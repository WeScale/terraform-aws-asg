output "private_subnet_ids" {
  description = "Ids of private subnets"
  value       = module.vpc-wsc.private_subnet_ids
}

output "vpc_id" {
  description = "vpc id"
  value       = module.vpc-wsc.vpc_id
}
output "asg_name" {
  value = module.autoscale_group.name
}

output "asg_arn" {
  value = module.autoscale_group.asg_arn
}
output "template_id" {
  value = module.autoscale_group.template_id
}
output "template_arn" {
  value = module.autoscale_group.template_arn
}