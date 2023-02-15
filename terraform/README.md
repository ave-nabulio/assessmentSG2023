# Terraform code for the assignment

## Prerequisites

- Terraform installed
- Azure CLI installed

## Quickstart

- Login to Azure CLI
- Run `./scripts/plan_apply.ps1` - to create the infrastructure with dev config (Windows powershell)
- Run `./scripts/destroy_infra.ps1` - to destroy the infrastructure (Windows powershell)

## Scripts

- `./scripts/login.ps1` - Login to the resource group
- `./scripts/minimal_requirement_task.ps1` - Creates a task with the command `ls -ltrh /opt` on the dev pool (you can run it on prod env with `-env prd` command)

