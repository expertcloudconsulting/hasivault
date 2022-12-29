resource "aws_security_group" "Vault-SG" {
  name        = "Basic-vault-sg-test"
  description = "QA-vault-Security Group"
  vpc_id      = "vpc-0bef8d30deb222509"
   
   ingress {
    description = "Allow SSH port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/16"]
  }
  ingress {
    description = "Vault API & Cluster bootstrapping"
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/16"]
  }
  ingress {
    description = "Raft, replication, request forwarding"
    from_port   = 8201
    to_port     = 8201
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/16"]
  }
  ingress {
    description = "Consul server RPC"
    from_port   = 7300
    to_port     = 7300
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/16"]
  }
  ingress {
    description = "Consul LAN gossip"
    from_port   = 7301
    to_port     = 7301
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/16"]
  }
  ingress {
    description = "Consul LAN gossip"
    from_port   = 7301
    to_port     = 7301
    protocol    = "udp"
    cidr_blocks = ["10.1.0.0/16"]
  }

  egress {
    description = "Allow all IP and Ports Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

