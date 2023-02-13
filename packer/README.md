# Packer code for the assignment

## Prerequisites

- [Packer](https://developer.hashicorp.com/packer/downloads) installed
- Azure CLI installed

## Quickstart

- Login to Azure CLI
- Run `./scripts/sanity_checks.ps1` - to check the code base is sane (Windows powershell)
- Create a file secrets.pkrvars.hcl with the following content:

```hcl
docker_username = "your_docker_hub_username"
docker_password = "your_docker_hub_password"
```
Note: This is to upload your image to Docker Hub. Do not save this file in a public repository.


- Run `./scripts/build.ps1` - to build the image and send it to Docker Hub (Windows powershell)
    