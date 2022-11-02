
#vpc-tfvars
aws_region          = "us-west-2"
vpc_cidr_block      = "10.50.0.0/16"
pub_sub_azs         = ["us-west-2a", "us-west-2b"]
pub_sub_cidr_block  = ["10.50.10.0/24", "10.50.20.0/24"]
priv_sub_azs        = ["us-west-2a", "us-west-2b"]
priv_sub_cidr_block = ["10.50.30.0/24", "10.50.40.0/24"]
global_route        = "0.0.0.0/0"
env                 = "stage"
sub_count = {
  "public"  = "2"
  "private" = "2"
}
network_tags = {
  "vpc"      = "stage_vpc"
  "priv_sub" = "priv_sub"
  "pub_sub"  = "pub_sub"
  "priv_rt"  = "priv_rt"
  "pub_rt"   = "pub_rt"
}

#ec2-tfvars
sg_name = {
  "kafka"         = "kafka-sg"
  "common"        = "common-sg"
  "mongo"         = "mongo-sg"
  "hazelcast"     = "hc-sg"
  "elk"           = "elk-sg"
  "grafana"       = "grafana-sg"
  "ftp"           = "ftp-sg"
  "kube"          = "internal-sg"
  "bastion"       = "bastion-sg"
  "private-nginx" = "private-nginx-sg"
  "public-nginx"  = "public-nginx-sg"
  "eks_cluster_additional_sg" = "sg for eks_cluster_additional_sg"
}
sg_info = {
  "kafka"         = "sg for kafka cluster "
  "mongo"         = "sg for mongo nodes"
  "hazelcast"     = "sg for hazelcast"
  "common"        = "sg for common access"
  "elk"           = "sg for elk"
  "grafana"       = "sg for prometheus and grafana"
  "ftp"           = "sg for public ftp"
  "kube"          = "sg for kube machine"
  "bastion"       = "sg for bastion host"
  "public-nginx"  = "sg for public-nginx"
  "eks_cluster_additional_sg" = "sg for eks_cluster_additional_sg "
}
#web_ports           = ["80", "443", "22", "9100", "2456", "8080", "9104"]
#ips = {
#  my_ip     = "200.123.45.6/32"
#  global_ip = "1.2.3.4/32"
#}

sg_rules_mongo = {
  db_access       = { from = 27017, to = 27017, proto = "tcp", cidr = "10.50.0.0/16" , desc = "Allow db port internally" }
  internal_access = { from = 0, to = 65530, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow internal access" }
}
sg_rules_common = {
  ssh_access           = { from = 22, to = 22, proto = "tcp", cidr = "0.0.0.0/0", desc = "Allow db port internally" }
  node_exporter_access = { from = 9100, to = 9100, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow node exporter to prometheus ip" }
}

sg_rules_bastion = {
  darby_ssh       = { from = 22, to = 22, proto = "tcp", cidr = "14.98.2.98/32", desc = "Allow ssh from " }
  darby_local_ssh = { from = 22, to = 22, proto = "tcp", cidr = "192.168.0.0/16", desc = "Allow ssh from " }
  darby_local_ssh = { from = 22, to = 22, proto = "tcp", cidr = "182.73.194.238/32", desc = "Allow ssh from Darby office AIRTEL" }
}

sg_rules_kafka = {
  kafka_access       = { from = 9092, to = 9092, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow kafka access internally" }
  zookeeper_access   = { from = 2181, to = 2181, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow zookeeper access internally" }
  pushgateway_access = { from = 9111, to = 9111, proto = "tcp", cidr = "10.50.35.78/32", desc = "Allow prometheus ip to scrape lag metrics" }
}

sg_rules_kube = {
  pushgateway_access = { from = 9091, to = 9091, proto = "tcp", cidr = "10.50.35.78/32", desc = "Allow prometheus ip to scrape pod metrics" }
}
sg_rules_hazelcast = {
  hc_access = { from = 5701, to = 5701, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow hazelcast access internally" }
}

sg_rules_public_nginx = {
  http_all_access  = { from = 80, to = 80, proto = "tcp", cidr = "0.0.0.0/0", desc = "Allow http to public" }
  https_all_access = { from = 443, to = 443, proto = "tcp", cidr = "0.0.0.0/0", desc = "Allow https to public" }
}

sg_rules_grafana = {
  pms_access     = { from = 9090, to = 9090, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow prometheus ui internally" }
  grafana_access = { from = 3000, to = 3000, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow grafana ui internally " }
  alert_access   = { from = 9093, to = 9093, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow alertmanager ui ui internally " }
}

sg_rules_elk = {
  kibana_access   = { from = 5601, to = 5601, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow kibana ui internally" }
  logstash_access = { from = 5044, to = 5044, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow logstash ui internally " }
  alert_access    = { from = 9200, to = 9200, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow elasticsearch ui ui internally " }
}

sg_rules_ftp = {
  ftp_access       = { from = 20, to = 21, proto = "tcp", cidr = "0.0.0.0/0", desc = "Allow ftp to public" }
  ftp_allow_access = { from = 1048, to = 2048, proto = "tcp", cidr = "0.0.0.0/0", desc = "Allow access to public" }
}

sg_rules_eks_additional = {
   htpps_access       = { from = 443, to = 443, proto = "tcp", cidr = "10.50.0.0/16", desc = "Allow access to kube" }

}
instance_count = {
  "kafka"           = "2"
  "mongo_message"   = "2"
  "hazelcast"       = "2"
}
instance_type = {
  "kafka"           = "t2.micro"
  "mongo_message"   = "t2.micro"
  "hazelcast"       = "t2.micro"
  "elk"             = "t2.micro"
  "grafana"         = "t2.micro"
  "ftp"             = "t2.micro"
  "bastion"         = "t2.micro"
  "mongo_ops"       = "t2.micro"
  "kube"            = "t2.micro"
  "public-nginx"    = "t2.micro"
}
instance_tags = {
  "kafka"           = "Kafka"
  "mongo_message"   = "Mongo-Message"
  "hazelcast"       = "HC"
  "elk"             = "ELK-Stack"
  "grafana"         = "Prometheus-Grafana"
  "ftp"             = "FTP"
  "bastion"         = "Bastion"
  "mongo_ops"       = "Ops-Manager"
  "kube"            = "Kube-Proxy"
  "public-nginx"    = "Public-Nginx"
}
volume_type = {
  "common" = "gp3"
}
root_vol_size = {
  "kafka"           = "10"
  "mongo_message"   = "10"
  "hazelcast"       = "10"
  "elk"             = "10"
  "grafana"         = "10"
  "ftp"             = "10"
  "kube"            = "10"
  "mongo_ops"       = "10"
  "bastion"         = "10"
  "public-nginx"    = "10"
  "private-nginx"   = "10"
}
data_vol_size = {
  "kafka"           = "10"
  "mongo_message"   = "50"
  "elk"             = "20"
  "grafana"         = "10"
  "mongo_ops"       = "10"
}
key_name = "stage_key"


##eks-tfvars
# aws_region        = "us-east-1"
cluster_name      = "DEV-EKS-Cluster"
cluster_version   = "1.22"
eks_cluster_role_name = "Dev_eks_cluster_role"
node_group_iam_role_name = "Dev_node_group_role"
Environment_name  = "Dev"
vpc_id            = "vpc-0685f904b18757b8b"
subnet_ids_for_eks_cluster            = ["subnet-0e9e4c7b1bf8b1a99","subnet-0bd9a2ae564102ee8","subnet-0a5dab413ba18649f","subnet-0132624679c9ea25a" ]
subnet_ids_for_eks_cluster_node_group = [ "subnet-0a5dab413ba18649f","subnet-0132624679c9ea25a"]
node_group_name   = ["Applications-node-group",  "Listeners-node-group"]
eks_instance_type = ["t3.xlarge", "t3.xlarge"]
eks_desired_size  = [2,1]
eks_max_size      = [3,2]
eks_min_size      = [2,1]
node_disk_size    = [20,20]
eks_cluster_node_group_taint_value = ["Applications", "Listeners"]
count = length(var.node_group_name)
#add the kube server ip address in  sg_rules_eks_additional variable at the cidr
# sg_rules_eks_additional = {
#    htpps_access       = { from = 443, to = 443, proto = "tcp", cidr = "10.30.54.241/32", desc = "Allow access to kube" }
# }
# sg_name = {
#   "eks_cluster_additional_sg" = "sg for eks_cluster_additional_sg"
# }
# sg_info = {
#   "eks_cluster_additional_sg" = "sg for eks_cluster_additional_sg"
# }

default_node_group_name      = "Default-node-group"
default_node_group_instance_type = ["t3.xlarge"]
default_node_disk_size = "20"
eks_desired_size_default_node =  1
eks_max_size_default_node = 3
eks_min_size_default_node = 1
