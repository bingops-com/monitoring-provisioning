resource "proxmox_virtual_environment_network_linux_bridge" "vlan_bridge" {
  node_name = var.node_name
  name      = var.network_name
  address   = var.network_address
  comment   = "Bridge ${var.network_name} for VLAN ${var.vlan_id}"
}

resource "proxmox_virtual_environment_network_linux_vlan" "vlan" {
  node_name = var.node_name
  name      = "vlan${var.vlan_id}"
  interface = var.network_bridge
  comment   = "VLAN ${var.vlan_id} for virtual machines"
}
