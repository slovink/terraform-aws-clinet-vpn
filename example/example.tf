provider "aws" {
  region = "us-west-2"
}

locals {
  name        = "vpn"
  environment = "test"
}

##---------------------------------------------------------------------------------------------------------------------------
## A VPC is a virtual network that closely resembles a traditional network that you'd operate in your own data center.
##---------------------------------------------------------------------------------------------------------------------------
module "vpc" {
  source = "git@github.com:slovink/terraform-aws-vpc.git?ref=v1.0.0"

  name            = local.name
  environment     = local.environment
  enable_flow_log = false
  cidr_block      = "10.0.0.0/16"
}

##-----------------------------------------------------
## A subnet is a range of IP addresses in your VPC.
##-----------------------------------------------------
#tfsec:ignore:aws-ec2-no-excessive-port-access
#tfsec:ignore:aws-ec2-no-public-ingress-acl
module "subnets" {
  source = "git@github.com:slovink/terraform-aws-subnet.git?ref=v1.0.0"

  nat_gateway_enabled = true
  name                = local.name
  environment         = local.environment
  availability_zones  = ["us-west-2a", "us-west-2b"]
  vpc_id              = module.vpc.id
  type                = "public-private"
  igw_id              = module.vpc.igw_id
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
}

##-----------------------------------------------------------------------------
## vpn module call.
##-----------------------------------------------------------------------------
module "vpn" {
  source = "../"

  name                = local.name
  environment         = local.environment
  split_tunnel_enable = true
  cidr_block          = "172.0.0.0/16"
  vpc_id              = module.vpc.id
  subnet_ids          = module.subnets.public_subnet_id
  route_cidr          = ["0.0.0.0/0", "0.0.0.0/0"]
  route_subnet_ids    = module.subnets.public_subnet_id
  network_cidr        = ["0.0.0.0/0"]
}
