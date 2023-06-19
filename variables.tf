# vars

variable "hcloud_token" {
  default = ""
}

variable "ssh_public_key" {
  description = "SSH public key for server access"
  type        = string
}
