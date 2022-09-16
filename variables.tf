# AWS Region: North of Virginia
variable "aws_region" {
  type    = string
}

variable "aws_profile" {
  type    = string
}

variable "Roles_List" {
 type = list(string)
}

/* Tags Variables */
#Use: tags = merge(var.project-tags, { Name = "${var.resource-name-tag}-place-holder" }, )
variable "project-tags" {
  type = map(string)
  default = {
    service     = "IAM_Lookup",
    environment = "POC",
    DeployedBy  = "JManzur - https://jmanzur.com/"
  }
}

#Use: tags = { Name = "${var.name-prefix}-lambda" }
variable "name-prefix" {
  type    = string
  default = "IAM_Lookup"
}