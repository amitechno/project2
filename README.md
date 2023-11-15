# Project: Deploy a High-Availability Web App using CloudFormation

This project aims to deploy a high-availability web application using AWS CloudFormation. The infrastructure includes a VPC with public and private subnets, an Internet Gateway, NAT Gateways, Load Balancer, Auto Scaling Group, and a Bastion Host for secure access to instances.

## Directory Structure

```
.
├── HA Application.pdf
├── README.md
├── parameters
│   ├── compute.json
│   └── network.json
├── scripts
│   ├── create.sh
│   └── update.sh
└── templates
    ├── compute
    │   └── compute.yml
    └── network
        └── network.yml
```

## Prerequisites

Before running the deployment scripts, make sure you have the AWS CLI installed and configured with necessary permissions. Also, ensure you have the required AWS EC2 key pair in your AWS account.

## Usage

### Step 1: Create Network Stack

To create the network stack, run the following command:

```bash
./scripts/create.sh project2-infra ./templates/network/network.yml ./parameters/network.json
```

### Step 2: Create Compute Stack

To create the compute stack, run the following command:

```bash
./scripts/create.sh project2-application ./templates/compute/compute.yml ./parameters/compute.json
```

### Step 3: Update Compute Stack

If you need to update the compute stack, run the following command:

```bash
./scripts/update.sh project2-application ./templates/compute/compute.yml ./parameters/compute.json
```

## Architecture Diagram

Please refer to the "HA Application.pdf" file for the architecture diagram of the deployed infrastructure.

## Outputs

### Network Stack Outputs

- `VPC`: A reference to the created VPC.
- `VPCPublicRouteTable`: Public routing table ID.
- `VPCPrivateRouteTable1`: Private routing table ID for Availability Zone 1.
- `VPCPrivateRouteTable2`: Private routing table ID for Availability Zone 2.
- `PublicSubnets`: A list of the public subnet IDs.
- `PrivateSubnets`: A list of the private subnet IDs.
- `PublicSubnet1`: A reference to the public subnet in the 1st Availability Zone.
- `PublicSubnet2`: A reference to the public subnet in the 2nd Availability Zone.
- `PrivateSubnet1`: A reference to the private subnet in the 1st Availability Zone.
- `PrivateSubnet2`: A reference to the private subnet in the 2nd Availability Zone.

### Compute Stack Outputs

- `LoadBalancerURL`: URL of the load balancer for the web application.
- `BastionHostPublicIP`: Public IP address of the Bastion Host for secure access to instances.

## Note

The Bastion Host has been deployed in a public subnet and assigned an Elastic IP for secure access to instances. Please use the Bastion Host's public IP to SSH into the instances within the private subnets.

Make sure to tear down the stacks when they are no longer needed to avoid incurring unnecessary costs.