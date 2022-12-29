# Create EC2 Instances for Cluster

resource "aws_instance" "vault_01" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  count         = var.ec2_instance_count
  subnet_id     = "subnet-06fe0aa9d553ffc5d"
  availability_zone = "ap-south-1a"
  key_name      = var.aws_key_name
  vpc_security_group_ids      = [aws_security_group.Vault-SG.id]
  user_data = file("tfscripts/Vault_01.sh")
  root_block_device {
      volume_size = "15"
    }
  tags = {
    "Name" = "QA-Vault_01"
    "consul_cluster" = "brvvx-vault-cluster"
  }
}
resource "aws_instance" "vault_02" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  count         = var.ec2_instance_count
  subnet_id     = "subnet-0f8cb4c4b6b7d7485"
  availability_zone = "ap-south-1b"
  key_name      = var.aws_key_name
  vpc_security_group_ids      = [aws_security_group.Vault-SG.id]
  user_data = file("tfscripts/Vault_02.sh")
  root_block_device {
      volume_size = "15"
    }
  tags = {
    "Name" = "QA-Vault_02"
    "consul_cluster" = "brvvx-vault-cluster"
  }
}


resource "aws_instance" "vault_03" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  count         = var.ec2_instance_count
  subnet_id     = "subnet-0f8cb4c4b6b7d7485"
  availability_zone = "ap-south-1b"
  key_name      = var.aws_key_name
  vpc_security_group_ids      = [aws_security_group.Vault-SG.id]
  user_data = file("tfscripts/Vault_03.sh")
  root_block_device {
      volume_size = "15"
    }
  tags = {
    "Name" = "QA-Vault_03"
    "consul_cluster" = "brvvx-vault-cluster"
  }
}
