# wp-db
Terraform project that deploys a MySQL instance with a web server running word press. Ansible is used to do the inital wordpress config. 

## Requirements
- AWS Account + way to connect credentials to terraform 
- Ansible on executing machine
- Private Key file used to connect to EC2 instance on AWS and localhost

## Variables
- vpc_id: id of a VPC that the instances will be placed in
- sn_id: id of a subnet in the same VPC as above that the EC2 will be placed in
- pvt_key_path: path on localhost to private key file used to ssh to EC2 instance
- pvt_key_name: name of the private key file on AWS
