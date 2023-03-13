module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> v2.0"

  name = "${var.prefix}-scs-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["${var.region}a"]
  public_subnets = ["10.0.0.0/24"]

  enable_nat_gateway = true

  tags = {
    Environment = "scs-k8s"
  }
}

resource "aws_eip" "f5" {
  instance = aws_instance.f5.id
  vpc      = true
}


resource "aws_security_group" "f5" {
  name   = "${var.prefix}-f5"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allow_from]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.allow_from]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

 
