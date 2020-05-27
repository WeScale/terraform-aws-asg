resource "aws_launch_template" "template" {
  name          = var.name_config
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = var.ip
    security_groups             = var.security_groups
    delete_on_termination       = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name           = var.name
      owner          = var.owner
      account        = terraform.workspace
      createdBy      = var.firstname
      taggingVersion = "1.0.0"
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  name                      = var.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  vpc_zone_identifier       = var.vpc_zone_identifier

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }


}
