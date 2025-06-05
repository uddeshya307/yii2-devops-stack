# Yii2 DevOps Stack

## 🚀 Overview
A complete DevOps solution for Yii2 PHP applications featuring automated deployment to AWS EC2 using Docker Swarm, Terraform infrastructure provisioning, and CI/CD pipelines with GitHub Actions.

## 🏗️ Architecture

The complete stack includes:

- **Sample Yii2 Application**: Ready-to-deploy PHP application
- **Containerization**: Docker configuration for the Yii2 app
- **Infrastructure as Code**: Terraform scripts for AWS EC2 provisioning
- **Orchestration**: Docker Swarm for container orchestration
- **CI/CD Pipeline**: GitHub Actions for automated deployments
- **Configuration Management**: Ansible playbooks for server setup
- **Automated Rollback**: Automatic rollback on deployment failures



## 🛠️ Quick Setup

### 1. Clone the Repository

```bash
git clone https://github.com/uddeshya307/yii2-devops-stack.git
cd yii2-devops-stack
```

### 2. Infrastructure Provisioning

Navigate to the Terraform directory and provision AWS EC2 infrastructure:

```bash
cd terraform_ec2

# Initialize Terraform
terraform init

# Plan the infrastructure
terraform plan

# Apply the configuration
terraform apply
```

This will create:
- AWS EC2 instance to run containerize application
- Automated Ansible playbook execution via user data
- Docker Swarm setup and application deployment

### 3. Verify Deployment

Once Terraform completes, access your application:

```bash
# Get the EC2 instance public IP from Terraform output
terraform output instance_public_ip

# Test the application
curl http://<EC2_INSTANCE_IP>
```

Or visit `http://<EC2_INSTANCE_IP>` in your browser.

### 4. CI/CD Pipeline Setup

The GitHub Actions workflow is automatically configured for continuous deployment:

```bash
# Make changes to your code
git add .
git commit -m "Update application"
git push origin main
```

The pipeline will:
- Build new Docker image
- Push to DockerHub
- Deploy new application image to EC2 instance via Docker Swarm
- Automatically rollback on failure


### Docker Swarm Status

SSH into your EC2 instance to check Docker Swarm status:

```bash
# Check Swarm status
docker node ls

# Check running services
docker service ls

# View service logs
docker service logs yii2_app_service

# To view container
docker service ps mystack_yii2 --no-trunc
```

### CI/CD Pipeline Monitoring

Monitor your deployments through GitHub Actions:

- Visit: `https://github.com/uddeshya307/yii2-devops-stack/actions`
- **Successful deployment example**: [Action Run #15471375422](https://github.com/uddeshya307/yii2-devops-stack/actions/runs/15471375422)

The pipeline includes:
- ✅ Image build and push to DockerHub
- ✅ Service update on EC2 instance
- ✅ Health checks and verification
- 🔄 Automatic rollback on failure

## 🛠️ Ansible Configuration

This project integrates with the [ansible-yii2-app-deploy](https://github.com/uddeshya307/ansible-yii2-app-deploy) repository for server configuration and application setup.

Refer to the ReadMe.md in the ansible-yii2-app-deploy repository for detailed instructions on server configuration and application setup
https://github.com/uddeshya307/ansible-yii2-app-deploy/blob/main/README.md
