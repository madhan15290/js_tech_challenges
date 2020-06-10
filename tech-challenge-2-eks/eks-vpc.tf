
data "aws_availability_zones" "available" {}

locals {
  cluster_name = "js_eks_cluster"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.6.0"

  name                 = "js-eks-clus-vpc"
  cidr                 = "10.234.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.234.1.0/24", "10.234.2.0/24"]
  public_subnets       = ["10.234.3.0/24", "10.234.4.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/js_eks_cluster" = "shared"
     cluster_id                            = "1234"
     region                                = "us-east-1"
     owner                                 = "madhan_rajendran"
     email                                 = "madhan.rajendran@junglescout.com"
     environment                           = "devops-dev01"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/js_eks_cluster" = "shared"
    "kubernetes.io/role/elb"               = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/js_eks_cluster" = "shared"
    "kubernetes.io/role/internal-elb"      = "1"
  }
}
