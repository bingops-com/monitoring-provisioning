# `node.tf` values

node_name = "homelab"
node_pool = "Monitoring"

nodes = {
  metrics = {
    host_ip        = "192.168.1.150/24"
    gw             = "192.168.1.1"
    vm_id          = 150
    cores          = 4
    memory         = 8192 # 8GB
    storage        = 100 # GB
    network_bridge = "vmbr0"
    role           = "master"
  },
  logs = {
    host_ip        = "192.168.1.151/24"
    gw             = "192.168.1.1"
    vm_id          = 151
    cores          = 6
    memory         = 12288 # 12GB
    storage        = 200 # GB
    network_bridge = "vmbr0"
    role           = "master"
  },
  grafana = {
    host_ip        = "192.168.1.152/24"
    gw             = "192.168.1.1"
    vm_id          = 152
    cores          = 4
    memory         = 4096 # 4GB
    storage        = 40 # GB
    network_bridge = "vmbr0"
    role           = "master"
  }
}

datastore      = "local-lvm"
template_vm_id = "9999"
