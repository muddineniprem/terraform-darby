variable "aws_region" {}
variable "cluster_name" {}
variable "cluster_version" {}
variable "environment_name" {}
variable "vpc_id" {}
variable "sg_rules_eks_additional" {}
variable "sg_name" {}
variable "sg_info" {}
variable "eks_instance_type" {}
variable "node_disk_size" {}
variable "subnet_ids_for_eks_cluster" {}
variable "subnet_ids_for_eks_cluster_node_group" {}
variable "eks_cluster_role_name" {}
variable "node_group_iam_role_name" {}
variable "eks_cluster_node_group_taint_value" {}

variable "node_group_name" {}
variable "eks_desired_size" {}
variable "eks_min_size" {}
variable "eks_max_size" {}
variable "default_node_group_name" {}
variable "default_node_group_instance_type" {} 
variable "default_node_disk_size" {}
variable "eks_desired_size_default_node" {}
variable "eks_max_size_default_node" {}
variable "eks_min_size_default_node" {}

