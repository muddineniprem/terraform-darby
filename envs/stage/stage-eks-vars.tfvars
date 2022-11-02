aws_region        = "us-west-2"
cluster_name      = "pre-prod-eks-cluster"
cluster_version   = "1.22"
eks_cluster_role_name = "pre_prod_eks_cluster_role"
node_group_iam_role_name = "pre_prod_node_group_role"
Environment_name  = "preprod"
vpc_id            = "vpc-08fcbad31b564128e"
subnet_ids_for_eks_cluster            = ["subnet-0f3b0d01a275f0250","subnet-0895d7b63609120af","subnet-01844355bd3b8abbf","subnet-0eb6c72eaa3bce2dc" ]
subnet_ids_for_eks_cluster_node_group = [ "subnet-01844355bd3b8abbf","subnet-0eb6c72eaa3bce2dc"]
node_group_name   = ["persisters-node-group",  "listeners-node-group"]
eks_instance_type = ["m5.large", "m5.large"]
eks_desired_size  = [1,1]
eks_max_size      = [2,2]
eks_min_size      = [1,1]
node_disk_size    = [50,50]
eks_cluster_node_group_taint_value = ["persisters", "listeners"]
count = length(var.node_group_name)
#add the kube server ip address in  sg_rules_eks_additional variable at the cidr
sg_rules_eks_additional = {
   htpps_access       = { from = 443, to = 443, proto = "tcp", cidr = "10.50.30.8/32", desc = "Allow access to kube" }
}
sg_name = {
  "eks_cluster_additional_sg" = "sg_for_preprod_eks_cluster_additional_sg"
}
sg_info = {
  "eks_cluster_additional_sg" = "sg_for_preprod_eks_cluster_additional_sg"
}

default_node_group_name      = "Default-node-group"
default_node_group_instance_type = ["m5.large"]
default_node_disk_size = "50"
eks_desired_size_default_node = 2
eks_max_size_default_node = 5
eks_min_size_default_node = 2
