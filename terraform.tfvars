
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
    vlan_id        = 100
  },
  logs = {
    host_ip        = "192.168.1.151/24"
    gw             = "192.168.1.1"
    vm_id          = 151
    cores          = 4
    memory         = 8192 # 8GB
    storage        = 200 # GB
    network_bridge = "vmbr0"
    role           = "master"
    vlan_id        = 100
  },
  grafana = {
    host_ip        = "192.168.3.152/24"
    gw             = "192.168.3.1"
    vm_id          = 152
    cores          = 4
    memory         = 4096
    storage        = 40
    network_bridge = "vmbr0"
    role           = "master"
    vlan_id        = 100
  }
}

datastore      = "local-lvm"
template_vm_id = "9999"
