variable "resource_group_name" {
  type        = string
  description = "Nom du ressource groupe"
}
variable "location" {
  type        = string
  description = "Localisation des ressources"
}
variable "node_resource_group" {
  type        = string
  description = "groupe de ressources AKS"
}
variable "global_tags" {
  type        = map(string)
  description = "tag global"
}
variable "aks_name" {
  type        = string
  description = "Nom du cluster AKS"
}
variable "dns_prefix" {
  type        = string
  description = "Préfix du nom DNS du Cluster AKS"
}
variable "identity" {
  type = object({
    type = string
  })
  description = "L'identité Managée du cluster AKS"
}
variable "tag" {
  type        = map(string)
  description = "Tag de la ressource AKS "
}
variable "node_pool_name" {
  type        = string
  description = "Nom du node pool "
}
variable "node_count" {
  type        = number
  description = "Nom de noeud du cluster AKS"
}
variable "vm_size" {
  type        = string
  description = "VM SKU"
}
variable "os_sku" {
  type        = string
  description = "Type de l'os des noeuds"
}
variable "scaling" {
  type        = bool
  description = "L'autoscaling option du clutser AKS"
}
variable "node_min" {
  type        = number
  description = "Le nombre minimum de noeuds sur le cluster"
}
variable "node_max" {
  type        = number
  description = "Le nombre maximum de noeuds sur le cluster"
}
variable "k8s_version" {
  type        = string
  description = "la version du cluster AKS"
}
variable "dns_service_ip" {
  type        = string
  description = "L'adresse ip du service DNS"
}
variable "svc_cidr" {
  type        = string
  description = "CIDR du service loadbalancer"
}
variable "lb_sku" {
  type        = string
  description = "Type du loadbalancer"
}
variable "out_type" {
  type        = string
  description = "Traffic sortant passe via load balancer"
}
variable "log_analytics_workspace_id" {
  type        = string
  description = "ID du workspace log analytics"
}
variable "enable_monitoring" {
  type        = bool
  description = "activer le monitoring du cluster via OMS agent"
}
