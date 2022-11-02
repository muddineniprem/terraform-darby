resource "aws_iam_role" "cluster_role" {
  name = var.eks_cluster_role_name


  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_role.name
}

resource "aws_iam_role_policy_attachment" "eks-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cluster_role.name
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  version  = var.cluster_version
  role_arn = aws_iam_role.cluster_role.arn
  
  vpc_config {
    endpoint_private_access = "true"
    endpoint_public_access = "false"
    subnet_ids = var.subnet_ids_for_eks_cluster
    security_group_ids = [ aws_security_group.eks_cluster_additional_sg.id ]
  }
  tags = {
    "Environment" = var.environment_name,
    "alpha.eksctl.io/cluster-oidc-enabled" = "true"
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy
  ]
}

resource "aws_security_group" "eks_cluster_additional_sg" {
  name = var.sg_name["eks_cluster_additional_sg"]
  description = var.sg_info["eks_cluster_additional_sg"]
  vpc_id = var.vpc_id
  egress {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = merge( { "Name" = var.sg_name["eks_cluster_additional_sg"] } )
}

resource "aws_security_group_rule" "sg_eks_cluster_additional_ingress_rules" {
  for_each          = var.sg_rules_eks_additional
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.eks_cluster_additional_sg.id
}
