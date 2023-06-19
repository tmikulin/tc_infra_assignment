# Configure the Hetzner provider
terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.40.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

# create a linked primary ip for the server
resource "hcloud_primary_ip" "internal_testing_ip" {
  name          = "internal_testing_ip"
  datacenter    = "fsn1-dc14"
  type          = "ipv4"
  assignee_type = "server"
  auto_delete   = true
  labels = {
    "ip" : "internal_testing"
  }
}


# create a Hetzner server
resource "hcloud_server" "internal-testing" {
  name        = "internal-testing"
  image       = "ubuntu-22.04"
  server_type = "cx11"
  location    = "fsn1"
  public_net {
    ipv4_enabled = true
    ipv4         = hcloud_primary_ip.internal_testing_ip.id
    ipv6_enabled = false
  }
  firewall_ids = [hcloud_firewall.internal_testing.id]
  user_data    = file("user_data.yml")
}


# output the server's IP address
output "server_ip" {
  value = hcloud_server.internal-testing.ipv4_address
}
