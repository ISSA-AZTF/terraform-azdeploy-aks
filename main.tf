# ID aléatoire
resource "random_id" "aks_suffix" {
  keepers = {
    cluster_name = var.aks_name
  }
  byte_length = 3
}

# Ressource groupe
data "azurerm_resource_group" "rg" {
  name     = "rg"
}

# Cluster AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.aks_name}-${random_id.aks_suffix.hex}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  node_resource_group = var.node_resource_group
  kubernetes_version  = var.k8s_version
  tags                = merge(var.tag, var.global_tags)

  identity {
    type = var.identity.type # Managed Identity
  }


  default_node_pool {

    name                 = var.node_pool_name
    node_count           = var.node_count
    vm_size              = var.vm_size
    os_sku               = var.os_sku
    auto_scaling_enabled = var.scaling
    min_count            = var.node_min
    max_count            = var.node_max
  }

  network_profile {
    network_plugin    = format("%s", "azure")
    network_policy    = format("%s", "azure")
    dns_service_ip    = var.dns_service_ip
    load_balancer_sku = var.lb_sku
    service_cidr      = var.svc_cidr
    outbound_type     = var.out_type
  }
  # Agent OMS
  dynamic "oms_agent" {
    for_each = var.enable_monitoring ? ["oms_creation"] : []
    content {
      log_analytics_workspace_id      = var.log_analytics_workspace_id
      msi_auth_for_monitoring_enabled = true
    }
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
