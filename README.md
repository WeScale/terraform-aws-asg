# terraform-aws-asg

- ``` terraform-aws-asg ``` is a Terraform module to create Auto-scaling group and launch template.
- it's an opensource module under GPL license

## Usage
```
module "autoscale_group" {

  source  = "mehdi-wsc/asg-wsc/aws"
  version = "0.0.6"

  name                      = "test"
  firstname                 = "antoine"
  lastname                  = "xavier"
  owner                     = "Aws"

  max_size                  = "5"
  min_size                  = "2"
  health_check_grace_period = "300"
  health_check_type         = "ELB"
  desired_capacity          = "3"
  force_delete              = true
  vpc_zone_identifier       = "subnet-xxxxxxxx"
  ami                       = "ami-5bdafa2c"
  name_config               = "test"
  instance_type             = "t2.micro"
  key                       = "test.key"
  ip                        = false
  security_groups           = ["sg-xxxxxxxx"]
}
```

## Input Variables:

| name                      | description                                                                                       | type         | required |
|---------------------------|---------------------------------------------------------------------------------------------------|--------------|----------|
| owner                     | The Owner of account                                                                              | string       | no       |
| firstname                 | Your first name                                                                                   | string       | no       |
| lastname                  | Your last name                                                                                    | string       | no       |
| name                      | name of ASG.                                                                                      | string       | yes      |
| max_size                  | Maximum number of instances.                                                                      | number       | yes      |
| min_size                  | Minimum number of instances.                                                                      | number       | yes      |
| desired_capacity          | Desire number of instances                                                                        | number       | yes      |
| vpc_zone_identifier       | define subnets.                                                                                   | list(string) | yes      |
| health_check_type         | type of health check                                                                              | string       | no       |
| health_check_grace_period | period to check instances health.                                                                 | number       | no       |
| force_delete              | allows deleting the autoscaling group without waiting for all instances in the pool to terminate. | bool         | no       |
| name_config               | Name of template configuration.                                                                   | string       | yes      |
| ami                       | Ami id used in template.                                                                          | string       | no       |
| instance_type             | the instance type                                                                                 | string       | yes      |
| key                       | ssh keys to access in instances.                                                                  | string       | no       |
| security_groups           | A list of security group IDs to associate.                                                        | list(string) | no           |
| ip                        | Associate a public ip address with the network interface.                                         | bool         | no       |


## Output Variables:

| name         | description          |
|--------------|----------------------|
| id           | auto scale group id  |
| name         | auto scale group name|
| asg_arn      | auto scale group arn |
| template_id  | launch template id   |
| template_arn |  launch template arn |

## License:
```
                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
software and other kinds of works.

  The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom to
share and change all versions of a program--to make sure it remains free
software for all its users.  We, the Free Software Foundation, use the
GNU General Public License for most of our software; it applies also to
any other work released this way by its authors.  You can apply it to
your programs, too.
```
