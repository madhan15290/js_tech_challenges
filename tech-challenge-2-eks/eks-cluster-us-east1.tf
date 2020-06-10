module "js_eks_cluster" {
  source          = "terraform-aws-modules/eks/aws" //Terraform module (available through the terraform registry) to create EKS cluster
  cluster_name    = "js_eks_cluster"
  cluster_version = "1.16"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  
  tags = {
    cluster_id  = "1234"
    region      = "us-east-1"
    owner       = "madhan_rajendran"
    email       = "madhan.rajendran@junglescout.com"
    environment = "devops-dev01"
  }

  worker_groups = [
    {
      name                          = "js-clus-small"
      instance_type                 = "t2.small"
      asg_desired_capacity          = 2
      asg_max_size                  = 5
      additional_security_group_ids = [aws_security_group.js_clus_small_sg.id]
    },
    {
      name                          = "js-clus-medium"
      instance_type                 = "t2.medium"
      asg_desired_capacity          = 1
      asg_max_size                  = 3
      additional_security_group_ids = [aws_security_group.js_clus_medium_sg.id]
    }
  ]
}

data "aws_eks_cluster" "js_eks_cluster" {
  name = module.js_eks_cluster.cluster_id
}

data "aws_eks_cluster_auth" "js_eks_cluster" {
  name = module.js_eks_cluster.cluster_id
}
