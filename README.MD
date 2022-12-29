# Brief 
These scripts will create the AMI's for Consul and Vault nodes on Ubuntu 18.04 base image
These scripts will create 3-Consul and 3-Vault Nodes for Cluster.
This will also take care of necessary security groups creation with respective ports

# Create AMI Images in AWS Account
./consul.sh
./vault.sh

#### For Customization
1. Update region, vpc, subnet-id's and environment names

# Update respective AMI ID's in 
variables.tf in variable = "ec2_ami_id" 

# Replace .pem keys in Main folder 
Folder Name "Consul_Vault"

# Update the key name in 
variable.tf in variable = "aws_key_name"

# Update Availibility Zone & Subnet-ID's in
ec2-instance.tf


# Update the Resource tag for the environment name
e.g. Dev, Staging, QA or Production
