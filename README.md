# TechCorp Terraform Assessment – Month 1

## 📌 Overview

This project provisions a highly available and secure web application infrastructure on AWS using Terraform.

The infrastructure includes:

* VPC with public and private subnets
* Internet Gateway and NAT Gateways
* Security Groups
* Bastion Host for secure access
* Web Servers (Apache)
* Database Server (PostgreSQL)
* Application Load Balancer

---

## ⚙️ Prerequisites

Before deploying, ensure you have:

* Terraform (v1.x or later)
* AWS CLI configured with credentials
* An SSH key pair (for EC2 access)
* Internet connection

---

## 📁 Project Structure

```
terraform-assessment/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── user_data/
│   ├── web_server_setup.sh
│   └── db_server_setup.sh
├── README.md
└── evidence/
    └── (deployment screenshots)
```

---

## 🚀 Deployment Steps

### 1. Initialize Terraform

```bash
cd terraform-assessment
terraform init
```

### 2. Review Execution Plan

```bash
terraform plan
```

### 3. Apply Configuration

```bash
terraform apply
```

Type `yes` when prompted.

---

## 🔐 SSH Access

### Bastion Host

```bash
ssh -i <your-key>.pem ec2-user@<bastion_public_ip>
```

### Web & Database Servers (via Bastion)

```bash
ssh -i <your-key>.pem ec2-user@<web_private_ip>
ssh -i <your-key>.pem ec2-user@<db_private_ip>
```

> Use values from:

```bash
terraform output
```

---

## 🌐 Application Verification

### Web Servers

Run on each web server:

```bash
curl http://localhost
```

---

### Load Balancer

Access in browser:

```bash
terraform output alb_dns_name
```

You should see responses from both web servers.

---

### PostgreSQL

On DB server:

```bash
sudo su - postgres
psql -l
```

---

## 📸 Deployment Evidence

Screenshots are included in the `evidence/` folder showing:

* Terraform plan output
* Terraform apply completion
* AWS resources
* Load balancer output
* SSH access (Bastion, Web, DB)
* PostgreSQL access

---

## 📤 Outputs

To retrieve deployed resource values:

```bash
terraform output
```

---

## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy
```

---

## ⚠️ Notes

* Replace placeholder values (IP addresses, key names) with your own.
* Do not hardcode sensitive values.
* Ensure AWS credentials are properly configured before deployment.