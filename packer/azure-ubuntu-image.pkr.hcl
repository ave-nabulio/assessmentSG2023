packer {
  required_plugins {
    azure-arm = {
      version = ">= 1.4.0"
      source  = "github.com/hashicorp/azure"
    }
  }
}

variable "location" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "managed_image_name" {
  type = string
}

variable "gallery_name" {
  type    = string
  default = "my_gallery"
}

source "azure-arm" "samtools-image" {
  use_azure_cli_auth = true

  subscription_id = var.subscription_id

  managed_image_name                = var.managed_image_name
  managed_image_resource_group_name = var.resource_group_name


  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = "UbuntuServer"
  image_sku       = "18.04-LTS"

  location = var.location
  vm_size  = "Standard_D2s_v3"

  async_resourcegroup_delete = true
}


build {
  name    = "build-machinery"
  sources = [
    "source.azure-arm.samtools-image",
  ]

  provisioner "shell" {
    environment_vars = [
      "SAMTOOLSVER=1.14",
      "FILE_URL=http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeUwRepliSeq/wgEncodeUwRepliSeqBg02esG1bAlnRep1.bam"
    ]
    scripts = [
      "scripts/install_components.sh",
      "scripts/install_samtools.sh",
      "scripts/download_bam_file.sh",
    ]
  }
}
