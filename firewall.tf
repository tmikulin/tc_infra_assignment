
# Create a Hetzner firewall
resource "hcloud_firewall" "internal_testing" {
  name = "internal-testing"
  rule {
    direction      = "in"
    protocol       = "tcp"
    source_ips     = ["18.158.69.72/32", "188.252.197.127/32"]
    port           = "80"
  }
}

# Output the firewall's ID
output "firewall_id" {
  value = hcloud_firewall.internal_testing.id
}
