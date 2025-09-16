resource "aws_vpc" "vpcdemo" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
  enable_dns_hostnames = true # if not enabled, we can't resolve dns names
}

resource "aws_subnet" "pubsubnet" {
  vpc_id     = aws_vpc.vpcdemo.id                   #Note

  cidr_block = var.pub_cidr_block               #Note
  availability_zone = var.pub_availability_zone  #Note
  map_public_ip_on_launch = true   # to indicate that instances launched into the subnet should be assigned a public IP address
  
  tags = {
    Name = "publicsubnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpcdemo.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.vpcdemo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public route table"
  }
}


resource "aws_route_table_association" "associate_with_pub_subnet" {
  #count          = length(var.pub_cidr_block)                             #NOTE
  subnet_id      = aws_subnet.pubsubnet.id   #NOTE
  route_table_id = aws_route_table.pub_route_table.id
}
resource "aws_eip" "my_elastic_ip" {
  #count = 1
  #vpc   = true
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.my_elastic_ip.id
  subnet_id     = aws_subnet.pubsubnet.id #aws_subnet.pubsubnet[*].id

  tags = {
    Name = "NAT gw"
  }
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_subnet" "prv_subnet" {
  vpc_id     = aws_vpc.vpcdemo.id
  #count      = length(var.prv_cidr_block)                      #Note

  cidr_block = var.prv_cidr_block                #Note
  availability_zone = var.prv_availability_zone  #Note
  map_public_ip_on_launch = false   # to indicate that instances launched into the subnet should not be assigned a public IP address
  
  tags = {
    Name = "prvsubnet"
  }
}

resource "aws_route_table" "priv_route_table" {
  vpc_id = aws_vpc.vpcdemo.id

   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_nat_gateway.nat.id
   }

  tags = {
    Name = "private route table"
  }
}

resource "aws_route_table_association" "associate_with_prv_subnet" {
 # count          = length(var.prv_cidr_block) 
  subnet_id      = aws_subnet.prv_subnet.id
  route_table_id = aws_route_table.priv_route_table.id
}