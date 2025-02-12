provider "aws" {
  region = var.aws_region
}


resource "aws_vpc" "group_1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "group-1"
  }
}

resource "aws_internet_gateway" "group_1_igw" {
  vpc_id = aws_vpc.group_1.id
  tags = {
    Name = "group-1-igw"
  }
}

resource "aws_subnet" "public" {
  count                   = 3
  vpc_id                  = aws_vpc.group_1.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "group-1-public-${count.index + 1}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.group_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.group_1_igw.id
  }
  tags = {
    Name = "group-1-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  count          = 3
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}



