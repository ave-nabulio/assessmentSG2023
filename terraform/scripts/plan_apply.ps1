param([String]$env = "dev")


if ("dev" -eq $env)
{
    echo "Initializing infrastructure for DEV environment..."
    echo "Start Planning..."
    terraform plan -var-file dev.tfvars -out main.tfplan
    echo "Start Applying..."
    terraform apply main.tfplan
}

if ("prd" -eq $env)
{
    echo "Initializing infrastructure for PRD environment..."
    echo "Start Planning..."
    terraform plan -var-file prd.tfvars -out main.tfplan
    echo "Start Applying..."
    terraform apply -var-file prd.tfvars main.tfplan
}




