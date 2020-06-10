module "js_eks_cluster_tiller" {
  source           = "github.com/darkn3rd/eks-tiller?ref=v0.0.1"                        
  region           = var.region                            
  eks_cluster_name = local.cluster_name                       
}
