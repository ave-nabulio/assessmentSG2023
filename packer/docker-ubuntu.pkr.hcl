packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}


variable "ubuntu_image" {
  type    = string
  default = "ubuntu:xenial"
}

variable "docker_username" {
  type = string

  description = "Username for docker hub"
}

variable "docker_password" {
  type        = string
  description = "Password for docker hub"
}

source "docker" "ubuntu" {
  image  = var.ubuntu_image
  commit = true
}

build {
  name = "build-machinery"
  sources = [
    "source.docker.ubuntu",
  ]

  provisioner "shell" {
    scripts = [
      "scripts/install_components.sh",
    ]
  }

  provisioner "shell" {
    environment_vars = [
      "SAMTOOLSVER=1.14",
    ]
    scripts = [
      "scripts/install_samtools.sh",
    ]
  }


  post-processors {
    post-processor "docker-tag" {
      repository = "raphaelrn/assessment-sg2023"
      tags       = ["latest"]
    }
    post-processor "docker-push" {
      login          = true
      login_username = var.docker_username
      login_password = var.docker_password
    }
  }
}
