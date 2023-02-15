
# This script will destroy the infrastructure created by the init_infra.ps1 script


param([String]$env = "dev")


if ("dev" -eq $env)
{
    echo "Start destroying infrastructure of the DEV environment..."
    terraform plan -destroy -var-file dev.tfvars -out main.destroy.tfplan
    terraform apply main.destroy.tfplan
}

if ("prd" -eq $env)
{
    echo "Start destroying infrastructure of the DEV environment..."
    terraform plan -destroy -var-file prd.tfvars -out main.destroy.tfplan
    terraform apply main.destroy.tfplan
}

