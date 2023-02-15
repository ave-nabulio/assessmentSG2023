# Packer code for the assignment

## Prerequisites

- [Packer](https://developer.hashicorp.com/packer/downloads) installed
- Azure CLI installed

## Quickstart

First create a secrets.pkrvars.hcl file with the following content:

```hcl
subscription_id    = "your subscription id"
managed_image_name = "your image name"
```

then

- Login to Azure CLI
- Run `./scripts/build.ps1` - to build the image and publish it (Windows powershell)
    