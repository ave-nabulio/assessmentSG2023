param([string]$env = "dev")


# Build machines using Packer
if ("dev" -eq $env)
{
    packer build -var-file=variables_dev.pkrvars.hcl -var-file=secrets.pkrvars.hcl azure-ubuntu-image.pkr.hcl
}
if ("prd" -eq $env)
{
    packer build -var-file=variables_prd.pkrvars.hcl -var-file=secrets.pkrvars.hcl azure-ubuntu-image.pkr.hcl
}
{

}
