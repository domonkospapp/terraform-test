#!/bin/bash
set -euo pipefail

cd ../../staging

# Create the resources
terraform init
terraform apply -auto-approve -var=db_user='user123' -var=db_pass='password123' -var=db_name='testdb' -var=db_pass='password123' -var=bucket_name='test321321312'

# Wait while the instance boots up
# (Could also use a provisioner in the TF config to do this)
sleep 60 

# Query the output, extract the IP and make a request
terraform output -json |\
jq -r '.web_app_module.value.load_balancer_dns_name' |\
xargs -I {} curl http://{} -m 10

# If request succeeds, destroy the resources
terraform destroy -auto-approve -var=db_user='user123' -var=db_pass='password123' -var=db_name='testdb' -var=db_pass='password123' -var=bucket_name='test321321312'
