provider "aws" {
  region     = "ap-south-1"
}

variable "cidr_blocks" {
  description = "cidr block for vpc and subnets"
  type = list(string)
}


resource "aws_vpc" "development-vpc" {
  cidr_block = var.cidr_block[0]
   tags = {
      Name: "development"

  }
}
resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "ap-south-1a"
  tags = {
      Name: "subnet-1-dev"
  }
}
