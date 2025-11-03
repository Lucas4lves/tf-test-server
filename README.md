# Terraform EC2 Instance Template

A modular Terraform template for deploying an EC2 instance with VPC, security groups, and networking components on AWS.

## Architecture

This template creates:
- **VPC** with public subnet and internet gateway
- **Security Group** with SSH access and internet egress
- **EC2 Instance** in the public subnet

## Modules

### 1. VPC Module (`./vpc`)
Creates a Virtual Private Cloud with public networking setup.

**Resources:**
- VPC with DNS support
- Internet Gateway
- Public Subnet
- Route Table with internet access
- Route Table Association

### 2. Security Groups Module (`./security-groups`)
Manages security group rules for the EC2 instance.

**Resources:**
- Security Group with SSH ingress (port 22)
- Egress rule for internet access

### 3. Instance Module (`./instance`)
Deploys the EC2 instance with specified configuration.

**Resources:**
- EC2 Instance with security group attachment

## Usage

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd tf-ec2-instance
   ```

2. **Configure variables**
   Create a `terraform.tfvars` file or set variables directly:
   ```hcl
   aws_region = "us-west-2"
   test_server_ami = "ami-0c02fb55956c7d316"
   key_pair_name = "my-key-pair"
   security_group_name = "my-test-sg"
   ```

3. **Deploy**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Variables

### General Configuration

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `aws_region` | string | `"us-east-1"` | AWS region for all resources |

### EC2 Configuration

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `test_server_ami` | string | `""` | AMI ID for the EC2 instance (required) |
| `test_server_instance_type` | string | `"t2.micro"` | EC2 instance type |
| `key_pair_name` | string | `""` | AWS key pair name for SSH access (required) |

### Security Group Configuration

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `security_group_name` | string | `""` | Name for the security group (required) |

### Networking Configuration

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `test_server_vpc_cidr_block` | string | `"10.0.0.0/16"` | CIDR block for the VPC |

### Resource Tagging

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| `test_server_tags` | map(string) | `{"test" = "true"}` | Tags for the EC2 instance |
| `test_server_vpc_tags` | map(string) | `{}` | Tags for the VPC |
| `test_server_vpc_internet_gateway_tags` | map(string) | `{}` | Tags for the internet gateway |
| `route_table_tags` | map(string) | `{}` | Tags for route tables |

## Required Variables

The following variables must be set before deployment:

- `test_server_ami` - Specify the AMI ID for your desired operating system
- `key_pair_name` - AWS key pair for SSH access to the instance
- `security_group_name` - Unique name for the security group

## Example Configuration

```hcl
# terraform.tfvars
aws_region = "us-west-2"
test_server_ami = "ami-0c02fb55956c7d316"  # Amazon Linux 2
test_server_instance_type = "t3.micro"
key_pair_name = "my-ec2-keypair"
security_group_name = "test-server-sg"

test_server_vpc_cidr_block = "10.0.0.0/16"

# Tags
test_server_tags = {
  Name        = "Test Server"
  Environment = "Development"
  Project     = "Testing"
}

test_server_vpc_tags = {
  Name = "Test VPC"
  Environment = "Development"
}
```

## Security Notes

- Modify the SSH ingress rule in `security-groups/main.tf` to match your IP address
- The instance is deployed in a public subnet with auto-assigned public IP

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with appropriate credentials
- AWS key pair created in the target region

## Outputs

The template provides outputs for:
- VPC ID
- Security Group ID
- EC2 Instance details (configured in respective modules)

## Clean Up

To destroy all resources:
```bash
terraform destroy
```
