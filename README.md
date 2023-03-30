
## 🚀 About Me
Ahmed Ali

# Task-1-Create EKS Cluster on AWS

A brief description of what this project does.
![image](https://drive.google.com/uc?export=view&id=1TInFkLpDoWfiFmZMEtJkQ7OqXuzbFBd5)


## Terraform Modules used:

- VPC Modules to create Networking section.
- EC2 instance Module to create Bastion Host.
- Security Group Module.

## Steps:

- Create EKS Cluster
- Create IAM role for EKS Cluster
- Create Public EKS Node Group
- Create Private EKS Node Group
- Create IAM role for EKS Node Group
- Execute Terraform Commands
```bash
   # Terraform Initialize
    terraform init

   # Terraform Validate
    terraform validate

   # Terraform plan
    terraform plan

   # Terraform Apply
    terraform apply -auto-approve

   # Verify Outputs on the CLI or using below command
    terraform output
```


## Installation:

- Install "kubectl CLI"
- Configure kubeconfig for kubectl
```bash
# Configure kubeconfig for kubectl
aws eks --region <region-code> update-kubeconfig --name <cluster_name>

# List Worker Nodes
kubectl get nodes
kubectl get nodes -o wide

# Verify Services
kubectl get svc
```
    
