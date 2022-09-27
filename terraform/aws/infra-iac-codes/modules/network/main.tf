resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags       = var.network_infra_tags
}

resource "aws_subnet" "my_subnet" {
  for_each                = var.vpc_subnets_cidr_block
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone_name
  map_public_ip_on_launch = each.value.allow_public_ip
  tags                    = var.network_infra_tags
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags   = var.network_infra_tags
}

# resource "aws_internet_gateway_attachment" "my_internet_gateway_attachment" {
#   vpc_id              = aws_vpc.my_vpc.id
#   internet_gateway_id = aws_internet_gateway.my_internet_gateway.id
# }

data "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "my_route_internet_gateway" {
  route_table_id         = data.aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_internet_gateway.id
}

resource "aws_security_group" "my_security_group" {
  name   = "${var.network_infra_tags.Name}-default-sg"
  vpc_id = aws_vpc.my_vpc.id
  tags   = var.network_infra_tags
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = -1
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = -1
  }
}