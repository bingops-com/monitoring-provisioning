resource "proxmox_virtual_environment_vm" "node" {
  for_each = var.nodes

  name        = each.key
  node_name   = var.node_name
  vm_id       = each.value.vm_id
  pool_id     = var.node_pool
  description = "VM for ${each.value.role}"

  started = true
  on_boot = true

  clone {
    vm_id        = var.template_vm_id
    datastore_id = var.datastore
  }

  connection {
    type = "ssh"
  }

  agent {
    enabled = true
  }

  initialization {
    ip_config {
      ipv4 {
        address = each.value.host_ip
        gateway = var.network_gateway
      }
    }

    user_account {
      username = "ubuntu"
      keys     = [var.ssh_key]
    }
  }

  cpu {
    type    = "host"
    cores   = each.value.cores
    sockets = 1
  }

  memory {
    dedicated = each.value.memory
  }

  disk {
    datastore_id = var.datastore
    file_format  = "raw"
    size         = each.value.storage
    interface    = "scsi0"
  }

  network_device {
    bridge   = var.network_name
    model    = "virtio"
    vlan_id  = var.vlan_id
  }
}
