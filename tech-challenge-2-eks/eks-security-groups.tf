resource "aws_security_group" "js_clus_small_sg" {
  name_prefix = "js_clus_small_sg_"
  vpc_id      = module.vpc.vpc_id

  tags = {
     Name                                  = "js_clus_small_sg" 
     cluster_id                            = "1234"
     region                                = "us-east-1"
     owner                                 = "madhan_rajendran"
     email                                 = "madhan.rajendran@junglescout.com"
     environment                           = "devops-dev01"
  }  

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.234.1.0/24"
    ]
  }
}

resource "aws_security_group" "js_clus_medium_sg" {
  name_prefix = "js_clus_medium_sg_"
  vpc_id      = module.vpc.vpc_id

  tags = {
     Name                                  = "js_clus_medium_sg" 
     cluster_id                            = "1234"
     region                                = "us-east-1"
     owner                                 = "madhan_rajendran"
     email                                 = "madhan.rajendran@junglescout.com"
     environment                           = "devops-dev01"
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.234.2.0/24"
    ]
  }
}

resource "aws_security_group" "js_clus_allow_all" {
  name_prefix = "js_clus_allow_all_"
  vpc_id      = module.vpc.vpc_id

  tags = {
     Name                                  = "js_clus_allow_all_sg" 
     cluster_id                            = "1234"
     region                                = "us-east-1"
     owner                                 = "madhan_rajendran"
     email                                 = "madhan.rajendran@junglescout.com"
     environment                           = "devops-dev01"
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.234.1.0/24",
      "10.234.2.0/24",
      "172.24.0.0/16"
    ]
  }
}
