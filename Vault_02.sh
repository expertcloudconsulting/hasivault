#!/bin/bash
HOSTNAME=Vault-ConsulAgent-02
DATACENTER=AWS
PRIMARY_DATACENTER=ap-south-1b
#CLUSTER_NAME=Basik-consul-cluster
CLUSTER_NAME2=Basik-vault-cluster
ENCRYPT_KEY=x5Wb39xpjxFF+sqOOXvmPqSYc7GBze7TfCxt49tsKbY=
BOOTSTARP_EXPECT=3

set -e

# echo "Create Consul Config File"

# echo "Setting tmp file from file final"
# FILE_FINAL=/etc/consul.d/consul.json
# FILE_TMP=$FILE_FINAL.tmp

# echo "Replacing strings for config file"

# echo "Join Production Consul Cluster"
# sed -i '/retry_join/c\ "retry_join": ["10.0.3.151", "10.0.4.241", "10.0.6.22"],' $FILE_TMP

# echo "disable ACL for test"
# sed -i '/"enabled": true,/c\ "enabled": false,' $FILE_TMP

# echo "Replacing the IP address of the Instance on Config"
# #IPADDR=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
# sed -i -- "s/{{ instance_ip }}/0.0.0.0/g" $FILE_TMP

# echo "Replacing string instace_id"
# sed -i -- "s/{{ instance_id }}/$HOSTNAME/g" $FILE_TMP

# echo "Replacing string encryption_key"
# sed -i -- "s/{{ encrypt_key }}/$ENCRYPT_KEY/g" $FILE_TMP

# echo "Replacing string region"
# sed -i -- "s/{{ datacenter }}/$DATACENTER/g" $FILE_TMP

# echo "Replacing string region"
# sed -i -- "s/{{ primary_datacenter }}/$PRIMARY_DATACENTER/g" $FILE_TMP

# echo "Replacing string consul_servers"
# sed -i -- "s/{{ cluster_name }}/$CLUSTER_NAME/g" $FILE_TMP

# echo "Replacing final file with tmp"
# mv $FILE_TMP $FILE_FINAL
# echo "Finished initializing consul agent config file"




echo "Create Vault Config File"

echo "Setting tmp file from file final"
FILE_FINAL=/etc/vault.d/vault.hcl
FILE_TMP=$FILE_FINAL.tmp

echo "Replacing string Vault_servers"
sed -i -- "s/{{ cluster_name }}/$CLUSTER_NAME2/g" $FILE_TMP

echo "Replacing the IP address of the Instance on Config"
IPADDR=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
sed -i -- "s/{{ Instance_IP}}/$IPADDR/g" $FILE_TMP

echo "Replacing final file with tmp"
mv $FILE_TMP $FILE_FINAL

echo "Finished initializing Vault config file"


echo "Waiting for 4-mins"
sleep 240 

echo "Creating Log dir"
sudo mkdir /var/log/vault
sudo chown vault:vault /var/log/vault

echo "Starting Consul agent and Vault Service"

sudo systemctl daemon-reload
sudo systemctl restart consul
sleep 60
sudo systemctl restart vault

export VAULT_ADDR='http://127.0.0.1:8200'