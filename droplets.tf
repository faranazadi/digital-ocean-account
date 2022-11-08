# Droplet related configuration
data "digitalocean_ssh_key" "ssh_key" {
  name = var.droplet_ssh_key_name
}

resource "digitalocean_droplet" "ubuntu_server" {
  image  = var.droplet_image
  name   = var.droplet_name
  region = var.droplet_region
  size   = var.droplet_size
  monitoring = var.droplet_monitoring
  graceful_shutdown = var.droplet_graceful_shutdown
  ssh_keys = [
    data.digitalocean_ssh_key.ssh_key.id
  ]
}

resource "digitalocean_project" "project" {
  name        = var.project_name
  description = var.project_description
  purpose     = var.project_purpose
  environment = var.project_environment
  resources   = [digitalocean_droplet.ubuntu_server.urn]
}

resource "digitalocean_firewall" "firewall" {
  name = var.firewall_main_rule_name

  droplet_ids = [digitalocean_droplet.ubuntu_server.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = [var.source_ip]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = [var.source_ip]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = [var.source_ip]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = [var.source_ip]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = [var.source_ip]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = [var.source_ip]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = [var.source_ip]
  }
}