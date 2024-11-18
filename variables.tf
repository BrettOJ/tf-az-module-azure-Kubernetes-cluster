variable "location" {
  description = "The location where the Managed Kubernetes Cluster should be created."
  type        = string
}

variable "resource_group_name" {
  description = "Specifies the Resource Group where the Managed Kubernetes Cluster should exist."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length."
  type        = string

}

variable "dns_prefix_private_cluster" {
  description = "Specifies the DNS prefix to use with private clusters."
  type        = string
}

variable "automatic_upgrade_channel" {
  description = "The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. Omitting this field sets this value to none."
  type        = string
}

variable "azure_policy_enabled" {
  description = "Should Azure Policy be enabled for this Kubernetes Cluster?"
  type        = bool
}

variable "cost_analysis_enabled" {
  description = "Should cost analysis be enabled for this Kubernetes Cluster?"
  type        = bool
}

variable "disk_encryption_set_id" {
  description = "The ID of the Disk Encryption Set which should be used for the Nodes and Volumes."
  type        = string
}

variable "edge_zone" {
  description = "Specifies the Extended Zone (formerly called Edge Zone) within the Azure Region where this Managed Kubernetes Cluster should exist."
  type        = string
}

variable "http_application_routing_enabled" {
  description = "Should HTTP Application Routing be enabled?"
  type        = bool
}

variable "image_cleaner_enabled" {
  description = "Specifies whether Image Cleaner is enabled."
  type        = bool
}

variable "image_cleaner_interval_hours" {
  description = "Specifies the interval in hours when images should be cleaned up."
  type        = number
}

variable "kubernetes_version" {
  description = "Version of Kubernetes specified when creating the AKS managed cluster."
  type        = string
}

variable "local_account_disabled" {
  description = "If true local accounts will be disabled."
  type        = bool
}

variable "node_os_upgrade_channel" {
  description = "The upgrade channel for this Kubernetes Cluster Nodes' OS Image."
  type        = string
}

variable "node_resource_group" {
  description = "The name of the Resource Group where the Kubernetes Nodes should exist."
  type        = string
}

variable "oidc_issuer_enabled" {
  description = "Enable or Disable the OIDC issuer URL."
  type        = bool
}

variable "open_service_mesh_enabled" {
  description = "Is Open Service Mesh enabled? For more details, please visit Open Service Mesh for AKS."
  type        = bool
}

variable "private_cluster_enabled" {
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
}

variable "private_dns_zone_id" {
  description = "Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise the cluster will have issues after provisioning. Changing this forces a new resource to be created."
  type        = string
}

variable "private_cluster_public_fqdn_enabled" {
  description = "Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to false."
  type        = bool
}

variable "workload_identity_enabled" {
  description = "Specifies whether Azure AD Workload Identity should be enabled for the Cluster. Defaults to false."
  type        = bool
}

variable "role_based_access_control_enabled" {
  description = "Whether Role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to true. Changing this forces a new resource to be created."
  type        = bool
}

variable "run_command_enabled" {
  description = "Whether to enable run command for the cluster or not. Defaults to true."
  type        = bool
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free."
  type        = string
}

variable "support_plan" {
  description = "The support plan for the Kubernetes Cluster. Possible values are NoSupport, Standard and Premium. Defaults to NoSupport."
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
}

variable "api_server_access_profile" {
  description = "An api_server_access_profile block as defined below."
  type = object({
    authorized_ip_ranges = list(string)
  })
  default = null
}

variable "auto_scaler_profile" {
  description = "An auto_scaler_profile block as defined below."
  type = object({
    balance_similar_node_groups                   = bool
    daemonset_eviction_for_empty_nodes_enabled    = bool
    daemonset_eviction_for_occupied_nodes_enabled = bool
    expander                                      = string
    ignore_daemonsets_utilization_enabled         = bool
    max_graceful_termination_sec                  = number
    max_node_provisioning_time                    = string
    max_unready_nodes                             = number
    max_unready_percentage                        = number
    new_pod_scale_up_delay                        = string
    scale_down_delay_after_add                    = string
    scale_down_delay_after_delete                 = string
    scale_down_delay_after_failure                = string
    scan_interval                                 = string
    scale_down_unneeded                           = string
    scale_down_unready                            = string
    scale_down_utilization_threshold              = number
    empty_bulk_delete_max                         = number
    skip_nodes_with_local_storage                 = bool
    skip_nodes_with_system_pods                   = bool
  })
  default = null
}

variable "azure_active_directory_role_based_access_control" {
  description = "An azure_active_directory_role_based_access_control block as defined below."
  type = object({
    admin_group_object_ids = list(string)
    azure_rbac_enabled     = bool
    tenant_id              = string
  })
  default = null
}

variable "confidential_computing" {
  description = "A confidential_computing block as defined below."
  type = object({
    sgx_quote_helper_enabled = bool
  })
  default = null
}

variable "monitor_metrics" {
  description = "An monitor_metrics block as defined below."
  type = object({
    annotations_allowed = string
    labels_allowed      = string
  })
  default = null
}

variable "default_node_pool" {
  description = "A default_node_pool block as defined below."
  type = object({
    name                          = string
    vm_size                       = string
    capacity_reservation_group_id = string
    auto_scaling_enabled          = bool
    host_encryption_enabled       = bool
    node_public_ip_enabled        = bool
    gpu_instance                  = string
    host_group_id                 = string
    kubelet_config = object({
      allowed_unsafe_sysctls    = list(string)
      container_log_max_line    = number
      container_log_max_size_mb = number
      cpu_cfs_quota_enabled     = bool
      cpu_cfs_quota_period      = string
      cpu_manager_policy        = string
      image_gc_high_threshold   = number
      image_gc_low_threshold    = number
      pod_max_pid               = number
      topology_manager_policy   = string
    })
    linux_os_config = object({
      swap_file_size_mb = number
      sysctl_config = object({
        fs_aio_max_nr                      = number
        fs_file_max                        = number
        fs_inotify_max_user_watches        = number
        fs_nr_open                         = number
        kernel_threads_max                 = number
        net_core_netdev_max_backlog        = number
        net_core_optmem_max                = number
        net_core_rmem_default              = number
        net_core_rmem_max                  = number
        net_core_somaxconn                 = number
        net_core_wmem_default              = number
        net_core_wmem_max                  = number
        net_ipv4_ip_local_port_range_max   = number
        net_ipv4_ip_local_port_range_min   = number
        net_ipv4_neigh_default_gc_thresh1  = number
        net_ipv4_neigh_default_gc_thresh2  = number
        net_ipv4_neigh_default_gc_thresh3  = number
        net_ipv4_tcp_fin_timeout           = number
        net_ipv4_tcp_keepalive_intvl       = number
        net_ipv4_tcp_keepalive_probes      = number
        net_ipv4_tcp_keepalive_time        = number
        net_ipv4_tcp_max_syn_backlog       = number
        net_ipv4_tcp_max_tw_buckets        = number
        net_ipv4_tcp_tw_reuse              = bool
        net_netfilter_nf_conntrack_buckets = number
        net_netfilter_nf_conntrack_max     = number
        vm_max_map_count                   = number
        vm_swappiness                      = number
        vm_vfs_cache_pressure              = number
      })
      transparent_huge_page_defrag  = string
      transparent_huge_page_enabled = string
    })
    fips_enabled      = bool
    kubelet_disk_type = string
    max_pods          = number
    node_network_profile = object({
      allowed_host_ports = object({
        port_start = number
        port_end   = number
        protocol   = string
      })
      application_security_group_ids = list(string)
      node_public_ip_tags            = map(string)
    })
    node_public_ip_prefix_id     = string
    node_labels                  = map(string)
    only_critical_addons_enabled = bool
    orchestrator_version         = string
    os_disk_size_gb              = number
    os_disk_type                 = string
    os_sku                       = string
    pod_subnet_id                = string
    proximity_placement_group_id = string
    scale_down_mode              = string
    snapshot_id                  = string
    temporary_name_for_rotation  = string
    type                         = string
    tags                         = map(string)
    ultra_ssd_enabled            = bool
    upgrade_settings = object({
      drain_timeout_in_minutes = number
      node_soak_duration_in_minutes = number
      max_surge       = number
    })
    vnet_subnet_id       = string
    workload_runtime     = string
    zones                = list(string)
    max_count            = number
    min_count            = number
    node_count           = number
  })
  default = null
}

variable "aci_connector_linux" {
  description = "An aci_connector_linux block as defined below."
  type = object({
    subnet_name = string
  })
  default = null
}

variable "identity" {
  description = "An identity block as defined below."
  type = object({
    type         = string
    identity_ids = list(string)
  })
  default = null
}

variable "key_management_service" {
  description = "A key_management_service block as defined below."
  type = object({
    key_vault_key_id         = string
    key_vault_network_access = string
  })
  default = null
}

variable "key_vault_secrets_provider" {
  description = "A key_vault_secrets_provider block as defined below."
  type = object({
    secret_rotation_enabled  = bool
    secret_rotation_interval = string
  })
  default = null
}


variable "kubelet_identity" {
  description = "A kubelet_identity block as defined below."
  type = object({
    client_id                 = string
    object_id                 = string
    user_assigned_identity_id = string
  })
  default = null
}


variable "linux_profile" {
  description = "Linux profile configuration"
  type        = object({
    admin_username = string
    ssh_key = object({
      key_data = string
    })
  })
}

variable "maintenance_window" {
  description = "A maintenance_window block as defined below."
  type = object({
    allowed = object({
      day   = string
      hours = list(string)
    })
    not_allowed = object({
      end   = string
      start = string
    })
  })
  default = null
}

variable "maintenance_window_auto_upgrade" {
  description = "A maintenance_window_auto_upgrade block as defined below."
  type = object({
    frequency    = string
    interval     = string
    duration     = string
    day_of_week  = string
    day_of_month = number
    week_index   = string
    start_time   = string
    utc_offset   = string
    start_date   = string
    not_allowed = object({
      end   = string
      start = string
    })
  })
  default = null
}

variable "maintenance_window_node_os" {
  description = "A maintenance_window_node_os block as defined below."
  type = object({
    frequency    = string
    interval     = string
    duration     = string
    day_of_week  = string
    day_of_month = number
    week_index   = string
    start_time   = string
    utc_offset   = string
    start_date   = string
    not_allowed = object({
      end   = string
      start = string
    })
  })
  default = null
}

variable "microsoft_defender" {
  description = "A microsoft_defender block as defined below."
  type = object({
    log_analytics_workspace_id = string
  })
  default = null
}

variable "network_profile" {
  description = "A network_profile block as defined below."
  type = object({
    network_plugin      = string
    network_mode        = string
    network_policy      = string
    dns_service_ip      = string
    network_data_plane  = string
    network_plugin_mode = string
    outbound_type       = string
    pod_cidr            = string
    pod_cidrs           = list(string)
    service_cidr        = string
    service_cidrs       = list(string)
    ip_versions         = list(string)
    load_balancer_sku   = string
    load_balancer_profile = object({
      backend_pool_type           = string
      idle_timeout_in_minutes     = number
      managed_outbound_ip_count   = number
      managed_outbound_ipv6_count = number
      outbound_ip_address_ids     = list(string)
      outbound_ip_prefix_ids      = list(string)
      outbound_ports_allocated    = number
    })
    nat_gateway_profile = object({
      idle_timeout_in_minutes   = number
      managed_outbound_ip_count = number
    })
  })
  default = null
}

variable "oms_agent" {
  description = "An oms_agent block as defined below."
  type = object({
    log_analytics_workspace_id      = string
    msi_auth_for_monitoring_enabled = bool
  })
  default = null
}

variable "ingress_application_gateway" {
  description = "An ingress_application_gateway block as defined below."
  type = object({
    gateway_id   = string
    gateway_name = string
    subnet_cidr  = string
    subnet_id    = string
  })
  default = null
}

variable "service_mesh_profile" {
  description = "A service_mesh_profile block as defined below."
  type = object({
    mode                             = string
    revisions                        = list(string)
    internal_ingress_gateway_enabled = bool
    external_ingress_gateway_enabled = bool
    certificate_authority = object({
      key_vault_id           = string
      root_cert_object_name  = string
      cert_chain_object_name = string
      cert_object_name       = string
      key_object_name        = string
    })
  })
  default = null
}

variable "service_principal" {
  description = "A service_principal block as defined below."
  type = object({
    client_id     = string
    client_secret = string
  })
  default = null
}


variable "storage_profile" {
  description = "A storage_profile block as defined below."
  type = object({
    blob_driver_enabled         = bool
    disk_driver_enabled         = bool
    file_driver_enabled         = bool
    snapshot_controller_enabled = bool
  })
  default = null
}


variable "web_app_routing" {
  description = "A web_app_routing block as defined below."
  type = object({
    dns_zone_ids = list(string)
  })
  default = null
}

variable "windows_profile" {
  description = "A windows_profile block as defined below."
  type = object({
    admin_username = string
    admin_password = string
    license        = string
    gmsa = object({
      dns_server  = string
      root_domain = string
    })
  })
  default = null
}

variable "workload_autoscaler_profile" {
  description = "A workload_autoscaler_profile block as defined below."
  type = object({
    keda_enabled                    = bool
    vertical_pod_autoscaler_enabled = bool
  })
  default = null
}

variable "http_proxy_config" {
  description = "A http_proxy_config block as defined below."
  type = object({
    http_proxy  = string
    https_proxy = string
    no_proxy    = string
  })
  default = null
  }

variable "naming_convention_info" {
  description = "A naming_convention_info block as defined below."
  type = object({
    name = string
    site = string
    env  = string
    app  = string
  })

}
