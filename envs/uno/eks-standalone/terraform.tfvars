aws_region        = "ap-south-1"
cluster_name      = "uno-eks-cluster"
cluster_version   = "1.22"
eks_cluster_role_name = "uno_eks_cluster_role"
node_group_iam_role_name = "uno_node_group_role"
environment_name  = "uno"
vpc_id            = "vpc-031921c924346fcd8"
subnet_ids_for_eks_cluster            = ["subnet-0be668b900e67b47e","subnet-05a566afcec441a27","subnet-0bec8736306248aa1","subnet-02976fae932f2c2b8" ]
subnet_ids_for_eks_cluster_node_group = [ "subnet-0bec8736306248aa1","subnet-02976fae932f2c2b8" ]
node_group_name   = ["apis-node-group","listeners-node-group","consumers-node-group","others-node-group"]
eks_instance_type = ["m5.xlarge", "m5.xlarge","m5.xlarge","m5.xlarge"]
eks_desired_size  = [1,1,1,1]
eks_max_size      = [2,2,2,2]
eks_min_size      = [1,1,1,1]
node_disk_size    = [50,50,50,50]
eks_cluster_node_group_taint_value = ["apis","listeners","consumers","others"]
count = length(var.node_group_name)
#add the kube server ip address in  sg_rules_eks_additional variable at the cidr
sg_rules_eks_additional = {
   htpps_access       = { from = 443, to = 443, proto = "tcp", cidr = "10.40.35.129/32", desc = "Allow access to kube" }
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
eks_desired_size_default_node = 1
eks_max_size_default_node = 2
eks_min_size_default_node = 1
