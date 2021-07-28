variable "project" {
  type = string
}

variable "service_account_email" {
  default = ""
}

variable "vpc_selflink" {
  type = string
}

variable "subnet_selflink" {
  type = string
}

variable "ssh_user" {
  default = "centos"
}

variable "ssh_pub_key_file" {
  default = "~/.ssh/id_rsa.pub"
}

variable "cluster_name" {
  default = string
}