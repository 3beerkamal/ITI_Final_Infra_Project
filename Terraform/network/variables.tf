variable "management_cidr" {
    type = string
}

variable "restricted_cidr" {
    type = string
}

variable "management_name" {
    default = "subnet1"
    type = string
}

variable "restricted_name" {
    default = "subnet2"
    type = string
}

variable "vpc_name" {
    default = "vpc"
    type = string
}

variable "project_id" {
    type = string
}

variable "management_region" {
    type = string
}

variable "restricted_region" {
    type = string
}

variable "router_name" {
  type = string
}