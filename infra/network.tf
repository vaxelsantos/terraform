resource "aws_vpc" "vpc-prd-s3" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc-terraform"
  }
}

resource "aws_subnet" "subnet-prd-s3" {
  vpc_id     = aws_vpc.vpc-prd-s3.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-terraform"
  }
}

resource "aws_internet_gateway" "internet-gateway-prd-s3" {
  vpc_id = aws_vpc.vpc-prd-s3.id

  tags = {
    Name = "internet-gateway-terraform"
  }
}

resource "aws_route_table" "route-table-prd-s3" {
  vpc_id = aws_vpc.vpc-prd-s3.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway-prd-s3.id
  }

  tags = {
    Name = "route-table-terraform"
  }
}

resource "aws_route_table_association" "route-table-association-prd-s3" {
  subnet_id      = aws_subnet.subnet-prd-s3.id
  route_table_id = aws_route_table.route-table-prd-s3.id
}


resource "aws_security_group" "sg-prd-s3" {
  name        = "security-group-prd-s3"
  description = "Traffic allow/deny in vpc"
  vpc_id      = aws_vpc.vpc-prd-s3.id
  tags = {
    Name = "security-group-vpc-terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg-prd-s3-in" {
  security_group_id = aws_security_group.sg-prd-s3.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "sg-prd-s3-out" {
  security_group_id = aws_security_group.sg-prd-s3.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


