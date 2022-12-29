#!/bin/bash
datacenter="us-east-1"
primary_datacenter="AWS-US"
encrypt_key="x5Wb39xpjxFF+sqOOXvmPqSYc7GBze7TfCxt49tsKbY="
cluster_name="consul-standalone"
METADATA_INSTANCE_ID="consul-standalone"

set -e

echo 'create tmp file'

FILE_FINAL=/etc/consul.d/consul.json
FILE_TMP=$FILE_FINAL.tmp

echo 'do all sed commands'
sudo sed -i -- "s|{{ datacenter }}|${datacenter}|g" $FILE_TMP
sudo sed -i -- "s|{{ primary_datacenter }}|${primary_datacenter}|g" $FILE_TMP
sudo sed -i -- "s|{{ encrypt_key }}|${encrypt_key}|g" $FILE_TMP
sudo sed -i -- "s|{{ acl_master_token }}|${acl_master_token}|g" $FILE_TMP
sudo sed -i -- "s|{{ acl_agent_token }}|${acl_agent_token}|g" $FILE_TMP
sudo sed -i -- "s|{{ acl_default_token }}|${acl_default_token}|g" $FILE_TMP
sudo sed -i -- "s|{{ consul_bootstrap_expect }}|${consul_bootstrap_expect}|g" $FILE_TMP
sudo sed -i -- "s|{{ cluster_name }}|${cluster_name}|g" $FILE_TMP

echo 'instance type'

#METADATA_INSTANCE_ID=`curl http://169.254.169.254/2014-02-25/meta-data/instance-id`
sudo sed -i -- "s|{{ instance_id }}|$METADATA_INSTANCE_ID|g" $FILE_TMP

echo 'set final file from tmp'
sudo mv $FILE_TMP $FILE_FINAL

sudo systemctl start consul

echo "Consul environment updated."

exit 0