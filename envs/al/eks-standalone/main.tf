module "eks" {
  source                  = "../../../modules/eks"
  aws_region              = var.aws_region
  cluster_name            = var.cluster_name      #"eks"
  cluster_version         = var.cluster_version
  node_group_iam_role_name = var.node_group_iam_role_name
  environment_name        = var.environment_name
  node_group_name         = var.node_group_name   #"eks-node"
  eks_instance_type       = var.eks_instance_type #"t2.medium"
  eks_desired_size        = var.eks_desired_size  #2
  eks_max_size            = var.eks_max_size      #3
  eks_min_size            = var.eks_min_size      #1
  node_disk_size          = var.node_disk_size
  eks_cluster_node_group_taint_value = var.eks_cluster_node_group_taint_value
  subnet_ids_for_eks_cluster = var.subnet_ids_for_eks_cluster
  subnet_ids_for_eks_cluster_node_group = var.subnet_ids_for_eks_cluster_node_group
  sg_rules_eks_additional = var.sg_rules_eks_additional
  vpc_id  = var.vpc_id
  eks_cluster_role_name    = var.eks_cluster_role_name
  sg_info = var.sg_info
  sg_name = var.sg_name
  default_node_group_name      = var.default_node_group_name
  default_node_group_instance_type = var.default_node_group_instance_type
  default_node_disk_size = var.default_node_disk_size
  eks_desired_size_default_node = var.eks_desired_size_default_node
  eks_max_size_default_node = var.eks_max_size_default_node
  eks_min_size_default_node = var.eks_min_size_default_node 
}

