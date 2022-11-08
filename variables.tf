# Input variables
variable "do_token" {}

variable "source_ip" {}

# Droplet variables
variable "droplet_ssh_key_name" {
    type = string
    default = "Fedora"
}

variable "droplet_image" {
    type = string
    default = "ubuntu-22-04-x64"
}

variable "droplet_name" {
    type = string
    default = "ubuntu"
}

variable "droplet_region" {
    type = string
    default = "ams3"
}

variable "droplet_size" {
    type = string
    default = "s-1vcpu-512mb-10gb"
}

variable "droplet_monitoring" {
    type = bool
    default = true
}

variable "droplet_graceful_shutdown" {
    type = bool
    default = true
}

# Project variables
variable "project_name" {
    type = string
    default = "terraform"
}

variable "project_description" {
    type = string
    default = "A project to represent somewhat temporary development resources within this account."
}

variable "project_purpose" {
    type = string
    default = "Class project / Educational purposes" 
}

variable "project_environment" {
    type = string
    default = "Development"
}

# Firewall variables

variable "firewall_main_rule_name" {
    type = string
    default = "allow-22-80-443-inbound-outbound"
}