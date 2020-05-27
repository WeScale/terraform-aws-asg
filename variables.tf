variable "name" {
  description = "name of asg"
}
variable "max_size" {
  description = " maximum number of EC2"
}
variable "min_size" {
  description = " minimum number of EC2"
}
variable "desired_capacity" {
  description = "desired number of EC2"
}
variable "health_check_grace_period" {
  type    = number
  default = 300
}
variable "health_check_type" {
  type    = string
  default = "EC2"
}
variable "force_delete" {
  type    = bool
  default = false
}
variable "vpc_zone_identifier" {
  description = "Subnets ids "
}

variable "key" {
  type        = string
  description = "The SSH key name that should be used for the instance"
  default     = ""
}
variable "ip" {
  type        = bool
  description = "Associate a public IP address with an instance in a VPC"
  default     = false
}

variable "security_groups" {

  description = "A list of associated security group IDs"
  type        = list(string)
  default     = []

}
variable "ami" {
  type        = string
  description = "The EC2 image ID to launch"
  default     = ""
}
variable "instance_type" {
  description = "Instance EC2 type"
}
variable "name_config" {
  description = "name of launch template"
}
variable "owner" {
  description = "the owner of the account "
  default     = ""

}
variable "firstname" {
  description = "the firstname of builder"
  default     = ""

}
variable "lastname" {
  description = "the last name of builder"
  default     = ""

}

