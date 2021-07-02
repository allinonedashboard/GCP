variable "clustername" {
  type = string
}

variable "location" {
  type = string
}

variable "project" {
  type = string
}

variable "nodecount" {
  type = number
}

variable "nodepoolname" {
  type = string
}

variable "machinetype" {
  type = string
}

variable "autoscaling_min_node_count" {
  type = number
  default = 1
}

variable "autoscaling_max_node_count" {
  type = number
  default = 3
}

variable "vpc_selflink" {
  type = string
}

variable "subnet_selflink" {
  type = string
}

variable "cluster_secondary_name" {
  type = string
}

variable "cluster_service_name" {
  type = string
}

variable "master_cidr"{
  default = "172.16.32.0/28"
}