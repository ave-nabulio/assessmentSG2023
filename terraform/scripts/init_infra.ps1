
# This script will initialize the infrastructure for the project
terraform plan -out main.tfplan
terraform apply main.tfplan