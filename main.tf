terraform {
  backend "remote" {
    organization = "NO-LIMIT"

    workspaces {
      name = "example"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
  access_key = "AKIAUAIHGDKPXUFJ5MEX"
  secret_key = "YQHDgNKloqtEZGF0Y8oXtQLSO5bPUYb4LTNgX4q+"
}

resource "aws_instance" "example" {
  ami= lookup({a="ami-830c94e3", b="ami-830c94e3ssss"}, "a", lower("ami-830c94e3"))
  instance_type = "t2.micro"
  tags = var.tags
}


variable "tags" {
  type = map(string)
  default = {
    env:"prod"
    name:"ec2"
    tagone:"ec2"
  }
}