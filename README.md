# Monitoring & Logging Infrastructure on Proxmox

This project automates the provisioning and configuration of a full observability stack using **Terraform** and **Ansible**. It deploys and configures **Prometheus**, **Grafana**, **Elasticsearch**, **Logstash**, and **Kibana** on virtual machines within a **Proxmox VE** environment.

---

## 🔧 Stack Overview

- **Proxmox VE** – Virtualization backend
- **Terraform** – VM provisioning (via `bpg/proxmox` provider)
- **Ansible** – Service configuration and orchestration
- **Prometheus + Alertmanager** – Metrics collection & alerting
- **Grafana** – Dashboard and visualization
- **Elasticsearch + Logstash + Kibana (ELK)** – Log aggregation & analysis
- **Node Exporter / Nginx Exporter** – Metrics exporters
- **GitHub Actions** – CI for linting (Terraform, Ansible, YAML)

---

## 🚀 Deployment Workflow

1. **Configure Terraform**  
   Update `terraform.tfvars` with VM specs and Proxmox settings.

2. **Provision VMs**  
   ```bash
   terraform init
   terraform apply
   ```

3. **Configure Services**
   ```bash
   ansible-playbook -i inventories/main/hosts site.yml
   ```

---

## ✅ Features

- End-to-end automation from VM creation to service deployment
- Predefined alerting rules and Grafana dashboards
- Secrets managed with **Ansible Vault**
- GitHub Actions for automated code linting and quality checks

---

## 📁 Project Skeleton

```
.
├── terraform/              # Terraform configs
├── ansible/
│   ├── roles/              # Modular Ansible roles
│   └── site.yml            # Main playbook
├── inventories/
├── group_vars/
├── .github/workflows/      # CI pipelines
└── README.md
```

---

## 📊 Dashboards

- Grafana dashboards automatically imported:
    - Node Exporter (ID: 1860)
    - Nginx Exporter (ID: 12708)

## 🔐 Security

- SSH key-only access (no root login)
- All sensitive data encrypted with **Ansible Vault**
- UFW configuration available (optional)
