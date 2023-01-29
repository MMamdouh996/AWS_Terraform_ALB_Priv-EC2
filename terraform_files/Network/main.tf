resource "aws_vpc" "vpc-x" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
    }
}

resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.vpc-x.id
  count = length(var.public-cidrs)
  cidr_block = var.public-cidrs[count.index]
  availability_zone = var.subnet_az[count.index]
    tags = {
    Name = "Subnet-x-public-${count.index}"
    }
}

resource "aws_subnet" "private-subnet" {
  vpc_id = aws_vpc.vpc-x.id
  count = length(var.private-cidrs)
  cidr_block = var.private-cidrs[count.index]
  availability_zone = var.subnet_az[count.index]
  tags = {
    Name = "Subnet-x-private-${count.index}"
  }
}

resource "aws_internet_gateway" "igw-x" {
  vpc_id = aws_vpc.vpc-x.id

  tags = {
    Name = "igw-tag-name"
  }
}

resource "aws_eip" "eip-x" {}

resource "aws_nat_gateway" "nat-x" {

  allocation_id = aws_eip.eip-x.id
  subnet_id     = aws_subnet.public-subnet[0].id
  depends_on    = [aws_subnet.public-subnet[0], aws_eip.eip-x]

}


resource "aws_route_table" "public-route-x" {
  vpc_id = aws_vpc.vpc-x.id

  route {
    cidr_block = var.route_table_in
    gateway_id = aws_internet_gateway.igw-x.id
  }

  tags = {
    Name = "public_route-x"
  }
}


resource "aws_route_table" "nat-route-x" {
  vpc_id = aws_vpc.vpc-x.id

  route {
    cidr_block = var.route_table_in
    gateway_id = aws_nat_gateway.nat-x.id
  }

  tags = {
    Name = "private_route-x"
  }
}

resource "aws_route_table_association" "public_rta" {
  count= length(var.public-cidrs)
  subnet_id      = aws_subnet.public-subnet[count.index].id

  route_table_id = aws_route_table.public-route-x.id
}

resource "aws_route_table_association" "private_rta" {
  count= length(var.private-cidrs)
  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.nat-route-x.id
}
