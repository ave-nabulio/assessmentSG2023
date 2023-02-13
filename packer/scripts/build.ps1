
# Build machines using Packer
packer build --var-file=variables.pkrvars.hcl --var-file=secrets.pkrvars.hcl docker-ubuntu.pkr.hcl