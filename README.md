# AWS Infrastructure & NGINX Deployment via Terraform

This repository contains Infrastructure as Code (IaC) written in **Terraform** to automatically provision a complete, secure AWS network environment and launch an EC2 instance running a Dockerized **NGINX** web server.

## 🏗️ Architecture Overview

The Terraform code provisions the following resources on AWS:

* **VPC:** Custom Virtual Private Cloud ($10.0.0.0/16$).
* **Subnet:** Public subnet ($10.0.1.0/24$) configured with automatic public IP assignment.
* **Internet Gateway (IGW):** Attached to the VPC to enable internet access.
* **Route Table:** Configured with a route directing internet-bound traffic ($0.0.0.0/0$) to the IGW.
* **Route Table Association:** Binds the public subnet to the public route table.
* **Security Group:** Allows inbound **HTTP (Port 80)** and **SSH (Port 22)** traffic, and unrestricted outbound traffic.
* **EC2 Instance:** Ubuntu/Amazon Linux instance bootstrapped via `user_data` to automatically install Docker and launch an NGINX container.

---

## 🛠️ Prerequisites

* [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.0+) installed on your local machine.
* [AWS CLI](https://aws.amazon.com/cli/) installed and configured (`aws configure`).
* An active **AWS Account** with sufficient IAM permissions to create VPC and EC2 resources.
* An **SSH Key Pair** generated on your local machine or in AWS.

---

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/prasad-zample-3/terraform-vpc-ec2-project.git
cd terraform-vpc-ec2-project

```

### 2. Initialize Terraform

Initialize the working directory containing Terraform configuration files:

```bash
terraform init

```

### 3. Review the Execution Plan

Generate and inspect the execution plan to see what resources will be created:

```bash
terraform plan

```

### 4. Apply Configuration

Provision the AWS infrastructure:

```bash
terraform apply -auto-approve

```

---

## 🌐 Verification

Once `terraform apply` finishes successfully:

1. Copy the public IP output provided in the terminal (or retrieve it from the AWS EC2 console).
2. Open your browser and navigate to:
```text
http://<EC2_PUBLIC_IP>

```


3. You should see the standard **"Welcome to nginx!"** landing page.

---

## 🧹 Clean Up

To destroy all AWS resources created by this Terraform project and avoid unexpected charges:

```bash
terraform destroy -auto-approve

```

```

```
