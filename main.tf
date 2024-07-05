resource "aws_vpc" "terraform_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform_VPC"
  }
}
resource "aws_subnet" "terraform_subnet" {
  vpc_id                  = aws_vpc.terraform_VPC.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "terraform_subnet"
  }
}
resource "aws_internet_gateway" "terraform_gateway" {
  vpc_id = aws_vpc.terraform_VPC.id

  tags = {
    Name = "terraform_gateway"
  }
}

resource "aws_route_table" "terraform_route_table" {
  vpc_id = aws_vpc.terraform_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_gateway.id
  }

  tags = {
    Name = "terraform_route_table"
  }
}

resource "aws_security_group" "terraform_security_group" {
  name        = "terraform_sg"
  description = "Allow all inbound traffic and all outbound traffic"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  
  tags = {
    Name = "terraform SG"
  }
}
