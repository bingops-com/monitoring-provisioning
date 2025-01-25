# Monitoring Provisioning with Ansible and Terraform

This repository provides a comprehensive solution for provisioning and managing a monitoring stack in a homelab environment. It leverages Terraform to create Proxmox virtual machines and Ansible to configure and deploy monitoring tools. The stack includes Prometheus, Grafana, Elasticsearch, Logstash, and Node Exporter for metrics collection, visualization, and logging.

## Features

- Automated provisioning of virtual machines using Terraform.
- Configuration management and software deployment with Ansible.
- Fully integrated monitoring stack:
    - **Prometheus** for metrics collection.
    - **Grafana** for visualization.
    - **Elasticsearch** and **Logstash** for centralized logging.
    - **Node Exporter** for exposing system metrics.
- Secure and modular design.

## Requirements

- **Terraform** (>= 1.0)
- **Ansible** (>= 2.11)
- **Proxmox VE** with API access enabled
- **Python** (>= 3.8)
- Proxmox API token with necessary permissions
- SSH access to VMs using public key authentication

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/0xBingo/monitoring-provisioning.git
cd monitoring-provisioning
```

### 2. Configure Terraform

Create a `credentials.auto.tfvars` file with the following content:

```hcl
proxmox_api_url = "https://192.168.1.100:8006"
proxmox_api_token = "your-api-token"
node_name = "homelab"
node_pool = "Monitoring"
ssh_key = "your-ssh-public-key"
```

Initialize and apply Terraform:

```bash
terraform init
terraform apply
```

### 3. Configure VMs with Ansible

Run the Ansible playbook to configure the VMs:

```bash
ansible-playbook bootstrap.yml -i inventories/main/hosts
ansible-playbook site.yml -i inventories/main/hosts
```

## Directory Structure

```plaintext
monitoring-provisioning/
│
│ # Ansible
├── bootstrap.yml             # Playbook for initial setup
├── site.yml                  # Main Ansible playbook
├── group_vars/
│   └── all.yml               # General variables
│
├── roles/
│   ├── ssh/                  # SSH configuration role
│   ├── firewall/             # Firewall setup role
│   ├── prometheus/           # Prometheus setup role
│   ├── grafana/              # Grafana setup role
│   ├── elasticsearch/        # Elasticsearch setup role
│   ├── logstash/             # Logstash setup role
│   └── node_exporter/        # Node Exporter setup role
│
│ # Terraform
├── main.tf                   # Proxmox resource definitions
├── node.tf                   # VM node configurations
├── pool.tf                   # Proxmox pool definitions
├── variables.tf              # Terraform variable definitions
├── terraform.tfvars          # User-specific variable values
├── credentials.auto.tfvars   # Sensitive credentials (git-ignored)
│
└── README.md                 # Documentation
```

## Configuration

### Terraform Variables

- `proxmox_api_url`: URL for Proxmox API
- `proxmox_api_token`: API token for authentication
- `node_name`: Proxmox node name
- `node_pool`: Node pool for categorization
- `ssh_key`: Public key for SSH access

### Ansible Variables

Global variables are defined in `group_vars/all.yml`:

```yaml
new_admin_user: "bingo"
grafana_ip: "{{ hostvars['grafana']['ansible_host'] }}"
metrics_ip: "{{ hostvars['metrics']['ansible_host'] }}"
logs_ip: "{{ hostvars['logs']['ansible_host'] }}"
```

Sensitive data is stored in encrypted Ansible Vault files.

## CI/CD Integration

This repository includes GitHub Actions workflows:

- **YAML Linting**: Validates YAML files.
- **Ansible Linting**: Ensures Ansible playbooks follow best practices.
- **Gitleaks**: Scans for sensitive data and secrets.

## Troubleshooting

### Common Issues

- **Terraform Errors**: Verify `terraform.tfvars` is correctly configured.
- **Ansible Errors**: Check inventory and variable configurations.
- **Connection Issues**: Ensure VMs are reachable via SSH.

### Debugging Tips

- Use Terraform debug mode:

  ```bash
  TF_LOG=DEBUG terraform apply
  ```

- Run Ansible with increased verbosity:

  ```bash
  ansible-playbook site.yml -i inventories/main/hosts -vvv
  ```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to propose changes.
