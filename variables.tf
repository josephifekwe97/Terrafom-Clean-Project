variable "aws_region" {
  description = "The AWS region to deploy resources into."
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The EC2 instance type."
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance."
  //default     = "ami-0c55b159cbfafe1f0"
   default =  "ami-0c7217cdde317cfec"
}

# variable "key_name" {
#   description = "The name of the key pair to use for SSH access."
# }

variable "subnet_id" {
  description = "The ID of the subnet to deploy the EC2 instance into."
}

variable "security_group_ids" {
  description = "A list of security group IDs to attach to the EC2 instance."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to apply to AWS resources."
  type        = map(string)
}
