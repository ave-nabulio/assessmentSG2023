
# This script will destroy the infrastructure created by the init_infra.ps1 script
terraform plan -destroy -out main.destroy.tfplan
terraform apply main.destroy.tfplan