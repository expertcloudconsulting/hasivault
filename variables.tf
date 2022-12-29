# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
}
variable "ec2_ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-07ffb2f4d65357b42"
}
variable "ec2_instance_type" {
  description = "Vault_Cluster"
  type        = string
  default     = "t2.micro"
}

variable "ec2_instance_count" {
  description = "EC2 Instance Count"
  type        = number
  default     = "1"
}

variable "workspace" {
  description = "vault"
}

variable "cluster_name" {
  type        = string
  default     = "vault-cluster"
}

variable "aws_key_name" {
  description = "EC2 Instance Count"
  type        = string
  default     = "aws-master-qa"
}