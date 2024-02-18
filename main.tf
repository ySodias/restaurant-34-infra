# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
# Fiap Pos tech

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "restaurant-34"

    workspaces {
      name = "tech-challenge"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "cluster" {
  name     = "cluster"
  role_arn = "arn:aws:iam::211125334332:role/LabRole"

  vpc_config {
    subnet_ids = [aws_subnet.example1.id, aws_subnet.example2.id]
  }
}

output "endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
}