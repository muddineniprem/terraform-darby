output "kubeconfig-certificate-authority-data" {
  value = module.eks.kubeconfig-certificate-authority-data
}

output "cluster-arn" {
  value = module.eks.cluster-arn
}
output "cluster-endpoint" {
  value = module.eks.cluster-endpoint
}
output "cluster-status" {
  value = module.eks.cluster-status
}
