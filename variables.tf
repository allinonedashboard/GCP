variable "project_name" {
  type    = string
  default = "able-river-315213"
}

variable "teamname" {
  type = string
}

variable "env" {
  type = string
}

variable "location" {
  type    = string
  default = "US"
}

variable "network_name" {
  type    = string
  default = "my-gke-vpc"
}

variable "ssh_pub_key_file" {
  default = "~/.ssh/id_rsa.pub"
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "machinetype" {
  type    = string
  default = "e2-micro"
}