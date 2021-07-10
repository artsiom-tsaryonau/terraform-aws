terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-sample"
    key    = "terraform/main/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ff1ec702aef8a505"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}