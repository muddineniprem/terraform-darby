aws_region        = "us-east-1"
environment_name  = "dev"

cluster_name      = "dev-qa-eks-cluster"
cluster_version   = "1.22"
eks_cluster_role_name = "dev_qa_eks_cluster_role"
node_group_iam_role_name = "dev_qa_node_group_role"

vpc_id            = "vpc-0685f904b18757b8b"
subnet_ids_for_eks_cluster            = ["subnet-0e9e4c7b1bf8b1a99","subnet-0a5dab413ba18649f","subnet-0bd9a2ae564102ee8","subnet-0132624679c9ea25a" ]
subnet_ids_for_eks_cluster_node_group = [ "subnet-0a5dab413ba18649f","subnet-0132624679c9ea25a"]

node_group_name   = ["persisters-node-group",  "listeners-node-group"]
eks_instance_type = ["t3.xlarge", "t3.xlarge"]
eks_desired_size  = [1,1]
eks_max_size      = [2,2]
eks_min_size      = [1,1]
node_disk_size    = [20,20]
eks_cluster_node_group_taint_value = ["persisters", "listeners"]
count = length(var.node_group_name)

default_node_group_name      = "default-node-group"
default_node_group_instance_type = ["t3.xlarge"]
default_node_disk_size = "20"
eks_desired_size_default_node = 4
eks_max_size_default_node = 6
eks_min_size_default_node = 4

#add the kube server ip address in  sg_rules_eks_additional variable at the cidr
sg_rules_eks_additional = {
   htpps_access       = { from = 443, to = 443, proto = "tcp", cidr = "10.30.54.241/32", desc = "Allow access to kube" }
}
sg_name = {
  "eks_cluster_additional_sg" = "sg_for_dev_qa_eks_cluster_additional_sg"
}
sg_info = {
  "eks_cluster_additional_sg" = "sg_for_dev_qa_eks_cluster_additional_sg"
}

