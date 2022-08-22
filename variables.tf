# AWS Region: North of Virginia
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
  default = ""
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

variable "Roles_List" {
 type = list(string)
 default = [
 	"arn:aws:iam::959033481857:role/IAM_Lookup"
	]
}