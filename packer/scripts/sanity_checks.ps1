
# This script is run as part of the packer build process to ensure that the packer build is sane.
packer fmt .
packer validate --var-file=variables.pkrvars.hcl --var-file=secrets.pkrvars.hcl .