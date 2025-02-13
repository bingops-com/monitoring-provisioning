# `network.tf` values

network_name  = "vmbr10"
network_bridge = "enp42s0"
network_address = "192.168.10.1/24"
network_gateway = "192.168.10.1"
vlan_id         = 10

# `node.tf` values

node_name = "homelab"
node_pool = "Monitoring"

nodes = {
  metrics = {
    host_ip        = "192.168.10.150/24"
    gw             = "192.168.10.1"
    vm_id          = 150
    cores          = 4
    memory         = 8192 # 8GB
    storage        = 100 # GB
    role           = "master"
  },
  logs = {
    host_ip        = "192.168.10.151/24"
    gw             = "192.168.1.1"
    vm_id          = 151
    cores          = 4
    memory         = 8192 # 8GB
    storage        = 200 # GB
    role           = "master"
  },
  grafana = {
    host_ip        = "192.168.10.152/24"
    gw             = "192.168.1.1"
    vm_id          = 152
    cores          = 4
    memory         = 4096 # 4GB
    storage        = 40 # GB
    role           = "master"
  }
}

datastore      = "local-lvm"
template_vm_id = "9999"
