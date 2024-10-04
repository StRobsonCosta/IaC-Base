terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 3.27"
      }
    }
    
  required_version = ">= 0.14.9"
}

provider "aws" {
    profile = "default"
    region = var.regiao_aws
}

resource "aws_instance" "app_server" {
  ami = "ami-03d5c68bab01f3496"
  instance_type = var.instancia
  key_name = var.chave
  /* user_data = <<-EOF
                #!/bin/bash
            cd /home/ubuntu
            echo "<h1>Feito com Terraform</h1>" > index.html
            nohup busybox httpd -f -p 8080 &
                EOF */
  tags = {
    Name = "Terraform Ansible Python"
  }
}

resource "aws_key_pair" "chaveSSH" {
  key_name = var.chave
  public_key = file("${var.chave}.pub")
}

output "IP_publico" {
  value = aws_instance.app_server.public_ip
}
