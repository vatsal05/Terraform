#internet VPC
resource "aws_vpc" "vpc1"{
  cidr_block="10.0.0.0/16"
  instance_tenancy ="default"
  enable_dns_support="true"
  enable_dns_hostnames ="true"
  enable_classiclink ="false"
}

#Subnets
resource "aws_subnet" "main_public"{
vpc_id="${aws_vpc.vpc1.id}"
cidr_block="10.0.1.0/24"
map_public_ip_on_launch="true"
availability_zone="eu-west-1a"

}
#internat_Gateway
resource "aws_internet_gateway" "IGW"{
vpc_id="${aws_vpc.vpc1.id}"

}
#route tables
resource "aws_route_table" "route"{
vpc_id="${aws_vpc.vpc1.id}"
route{
      cidr_block="0.0.0.0/0"
      gateway_id="${aws_internet_gateway.IGW.id}"
} 
   
}

#route associations public
resource "aws_route_table_association" "route_assoc"{
subnet_id="${aws_subnet.main_public.id}"
route_table_id="${aws_route_table.route.id}"
}

