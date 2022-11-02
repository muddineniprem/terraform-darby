aws_region        = "ap-south-1"
cluster_name      = "al-eks-cluster"
cluster_version   = "1.22"
eks_cluster_role_name = "al_eks_cluster_role"
node_group_iam_role_name = "al_node_group_role"
environment_name  = "al"
vpc_id            = "vpc-0c5f9da7ca44b1c24"
subnet_ids_for_eks_cluster            = ["subnet-0c3834a3107824c7c","subnet-0a3196aa3bbe32e17","subnet-00ef3093079aec05c","subnet-0e21f3d0717c5323b","subnet-0470572140543e8c5","subnet-0ae2df1d8e09ae9a5" ]
subnet_ids_for_eks_cluster_node_group = [ "subnet-0e21f3d0717c5323b","subnet-0470572140543e8c5","subnet-0ae2df1d8e09ae9a5" ]
node_group_name   = ["listeners-node-group","consumers-node-group","apis-node-group","persisters-node-group","ups-node-group","streamers-node-group","jobs-node-group","others-node-group" ]
eks_instance_type = ["m5.xlarge", "m5.xlarge","m5.xlarge","m5.xlarge","m5.xlarge","m5.xlarge" ]
eks_desired_size  = [2,2,2,2,2,2,1,1]
eks_max_size      = [3,3,3,3,3,3,2,2]
eks_min_size      = [2,2,2,2,2,2,1,1]
node_disk_size    = [50,50,50,50,50,50]
eks_cluster_node_group_taint_value = ["listeners","consumers","apis","persisters","ups","streamers","jobs","others" ]
count = length(var.node_group_name)
#add the kube server ip address in  sg_rules_eks_additional variable at the cidr
sg_rules_eks_additional = {
   htpps_access       = { from = 443, to = 443, proto = "tcp", cidr = "need to update", desc = "Allow access to kube" }
}
sg_name = {
  "eks_cluster_additional_sg" = "sg_for_uno_eks_cluster_additional_sg"
}
sg_info = {
  "eks_cluster_additional_sg" = "sg_for_uno_eks_cluster_additional_sg"
}

default_node_group_name      = "default-node-group"
default_node_group_instance_type = ["m5.xlarge"]
default_node_disk_size = "50"
eks_desired_size_default_node = 2
eks_max_size_default_node = 4
eks_min_size_default_node = 2

