aws_region        = "us-west-2"
cluster_name      = "preprod-eks-cluster"
cluster_version   = "1.22"
eks_cluster_role_name = "preprod_eks_cluster_role"
node_group_iam_role_name = "preprod_node_group_role"
environment_name  = "preprod"
vpc_id            = "vpc-08fcbad31b564128e"
subnet_ids_for_eks_cluster            = ["subnet-0f3b0d01a275f0250","subnet-0895d7b63609120af","subnet-01844355bd3b8abbf","subnet-0eb6c72eaa3bce2dc" ]
subnet_ids_for_eks_cluster_node_group = [ "subnet-01844355bd3b8abbf","subnet-0eb6c72eaa3bce2dc"]
node_group_name   = ["apis-node-group","listeners-node-group","consumers-node-group","others-node-group"]
eks_instance_type = ["m5.large", "m5.large","m5.large","m5.large"]
eks_desired_size  = [2,1,1,2]
eks_max_size      = [4,4,3,3]
eks_min_size      = [2,1,1,2]
node_disk_size    = [50,50,50,50]
eks_cluster_node_group_taint_value = ["apis","listeners","consumers","others"]
count = length(var.node_group_name)
#add the kube server ip address in  sg_rules_eks_additional variable at the cidr
sg_rules_eks_additional = {
   htpps_access       = { from = 443, to = 443, proto = "tcp", cidr = "10.50.30.8/32", desc = "Allow access to kube" },
   alprod_udp_traffic = { from = 30382, to = 30382, proto = "udp", cidr = "0.0.0.0/0", desc = "ALPROD-UDP-TRAFFIC" },
   alprod_udp_healthcheck = { from = 30384, to = 30384, proto = "tcp", cidr = "10.50.0.0/16", desc = "ALPROD-UDP-HEALTHCHECK" },
   alpd_udp_traffic = { from = 30381, to = 30381, proto = "udp", cidr = "0.0.0.0/0", desc = "ALPD-UDP-TRAFFIC" },
   alpd_udp_healthcheck = { from = 30383, to = 30383, proto = "tcp", cidr = "10.50.0.0/16", desc = "ALPD-UDP-HEALTHCHECK" }
}
sg_name = {
  "eks_cluster_additional_sg" = "sg_for_preprod_eks_cluster_additional_sg"
}
sg_info = {
  "eks_cluster_additional_sg" = "sg_for_preprod_eks_cluster_additional_sg"
}

default_node_group_name      = "default-node-group"
default_node_group_instance_type = ["m5.large"]
default_node_disk_size = "50"
eks_desired_size_default_node = 1
eks_max_size_default_node = 3
eks_min_size_default_node = 1
