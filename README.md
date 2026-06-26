# Amazon EKS Cluster Provisioning with Terraform

This project provisions an Amazon Elastic Kubernetes Service (EKS) cluster on AWS using Terraform. It leverages the official Terraform AWS modules to create a production-ready infrastructure including a VPC, managed node groups, and EKS add-ons.

## 🚀 Architecture

<img src = "https://github.com/shashankkanade25/EKS-Terraform/blob/main/EKS_Architecture.png?raw=true">

The infrastructure includes:

- Amazon EKS Cluster
- Amazon VPC
- Public, Private, and Intra Subnets
- NAT Gateway
- Internet Gateway
- EKS Managed Node Group
- VPC CNI Add-on
- CoreDNS Add-on
- Kube Proxy Add-on

## 📁 Project Structure

```text
.
├── eks.tf              # EKS cluster configuration
├── vpc.tf              # VPC configuration
├── providers.tf        # AWS provider configuration
├── variables.tf        # Input variables
├── terraform.tf        # Terraform settings
├── .gitignore
└── README.md
```

## 🛠️ Prerequisites

- AWS Account
- AWS CLI installed and configured
- Terraform >= 1.5
- kubectl
- Git

Verify installations:

```bash
terraform version
aws --version
kubectl version --client
```

## ⚙️ Configure AWS Credentials

```bash
aws configure
```

Provide:

- AWS Access Key
- AWS Secret Key
- Default Region (e.g. ap-south-1)
- Output Format (json)

## 📦 Initialize Terraform

```bash
terraform init
```

## 🔍 Validate Configuration

```bash
terraform validate
```

## 📋 Preview Infrastructure

```bash
terraform plan
```

## 🚀 Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

when prompted.

## 🔗 Configure kubectl

After the EKS cluster is created:

```bash
aws eks update-kubeconfig --region ap-south-1 --name <cluster-name>
```

Verify the cluster:

```bash
kubectl get nodes
```

Expected output:

```text
NAME                                       STATUS   ROLES    AGE
ip-xxx-xxx-xxx-xxx.ap-south-1.compute.internal   Ready    <none>   2m
```

## 🧹 Destroy Infrastructure

To delete all AWS resources:

```bash
terraform destroy
```

## 📚 Terraform Modules Used

- terraform-aws-modules/vpc/aws
- terraform-aws-modules/eks/aws

## 🔒 Security Notes

The following files are excluded from version control:

- `.terraform/`
- `terraform.tfstate`
- `terraform.tfstate.backup`
- `*.tfvars`

AWS credentials are **not** stored in this repository.

## 📖 Technologies Used

- Terraform
- AWS EKS
- Amazon VPC
- AWS CLI
- Kubernetes

## 👨‍💻 Author

**Shashank Kanade**

GitHub: https://github.com/shashankkanade25
