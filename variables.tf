variable "aws_region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "c7i-flex.large"
}

variable "key_name" {
  default = "netflix"
}

variable "ami_id_jenkins" {
  default = "ami-01a00762f46d584a1"
}

variable "ami_id_k8s" {
  default = "ami-006f82a1d5a27da54"
}
