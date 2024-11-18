resource "azurerm_kubernetes_cluster" "aks" {
  name                                = module.acr_name.naming_convention_output["${var.naming_convention_info.name}"].names.0
  location                            = var.location
  resource_group_name                 = var.resource_group_name
  dns_prefix                          = var.dns_prefix
  dns_prefix_private_cluster          = var.dns_prefix_private_cluster
  automatic_upgrade_channel           = var.automatic_upgrade_channel
  azure_policy_enabled                = var.azure_policy_enabled
  cost_analysis_enabled               = var.cost_analysis_enabled
  disk_encryption_set_id              = var.disk_encryption_set_id
  edge_zone                           = var.edge_zone
  http_application_routing_enabled    = var.http_application_routing_enabled
  image_cleaner_enabled               = var.image_cleaner_enabled
  image_cleaner_interval_hours        = var.image_cleaner_interval_hours
  kubernetes_version                  = var.kubernetes_version
  local_account_disabled              = var.local_account_disabled
  node_os_upgrade_channel             = var.node_os_upgrade_channel
  node_resource_group                 = var.node_resource_group
  oidc_issuer_enabled                 = var.oidc_issuer_enabled
  workload_identity_enabled           = var.workload_identity_enabled
  role_based_access_control_enabled   = var.role_based_access_control_enabled
  run_command_enabled                 = var.run_command_enabled
  open_service_mesh_enabled           = var.open_service_mesh_enabled
  private_cluster_enabled             = var.private_cluster_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  sku_tier                            = var.sku_tier
  support_plan                        = var.support_plan
  tags                                = var.tags

  default_node_pool {
    name                          = var.default_node_pool.name
    vm_size                       = var.default_node_pool.vm_size
    capacity_reservation_group_id = var.default_node_pool.capacity_reservation_group_id
    auto_scaling_enabled          = var.default_node_pool.auto_scaling_enabled
    host_encryption_enabled       = var.default_node_pool.host_encryption_enabled
    node_public_ip_enabled        = var.default_node_pool.node_public_ip_enabled
    gpu_instance                  = var.default_node_pool.gpu_instance
    host_group_id                 = var.default_node_pool.host_group_id
    kubelet_config {
        allowed_unsafe_sysctls    = var.default_node_pool.kubelet_config.allowed_unsafe_sysctls
        container_log_max_line    = var.default_node_pool.kubelet_config.container_log_max_line
        container_log_max_size_mb = var.default_node_pool.kubelet_config.container_log_max_size_mb
        cpu_cfs_quota_enabled     = var.default_node_pool.kubelet_config.cpu_cfs_quota_enabled
        cpu_cfs_quota_period      = var.default_node_pool.kubelet_config.cpu_cfs_quota_period
        cpu_manager_policy        = var.default_node_pool.kubelet_config.cpu_manager_policy
        image_gc_high_threshold   = var.default_node_pool.kubelet_config.image_gc_high_threshold
        image_gc_low_threshold    = var.default_node_pool.kubelet_config.image_gc_low_threshold
        pod_max_pid               = var.default_node_pool.kubelet_config.pod_max_pid
        topology_manager_policy   = var.default_node_pool.kubelet_config.topology_manager_policy
    }
    linux_os_config {
        swap_file_size_mb = var.default_node_pool.linux_os_config.swap_file_size_mb
        sysctl_config {
          fs_aio_max_nr                      = var.default_node_pool.linux_os_config.sysctl_config.fs_aio_max_nr
          fs_file_max                        = var.default_node_pool.linux_os_config.sysctl_config.fs_file_max
          fs_inotify_max_user_watches        = var.default_node_pool.linux_os_config.sysctl_config.fs_inotify_max_user_watches
          fs_nr_open                         = var.default_node_pool.linux_os_config.sysctl_config.fs_nr_open
          kernel_threads_max                 = var.default_node_pool.linux_os_config.sysctl_config.kernel_threads_max
          net_core_netdev_max_backlog        = var.default_node_pool.linux_os_config.sysctl_config.net_core_netdev_max_backlog
          net_core_optmem_max                = var.default_node_pool.linux_os_config.sysctl_config.net_core_optmem_max
          net_core_rmem_default              = var.default_node_pool.linux_os_config.sysctl_config.net_core_rmem_default
          net_core_rmem_max                  = var.default_node_pool.linux_os_config.sysctl_config.net_core_rmem_max
          net_core_somaxconn                 = var.default_node_pool.linux_os_config.sysctl_config.net_core_somaxconn
          net_core_wmem_default              = var.default_node_pool.linux_os_config.sysctl_config.net_core_wmem_default
          net_core_wmem_max                  = var.default_node_pool.linux_os_config.sysctl_config.net_core_wmem_max
          net_ipv4_ip_local_port_range_max   = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_ip_local_port_range_max
          net_ipv4_ip_local_port_range_min   = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_ip_local_port_range_min
          net_ipv4_neigh_default_gc_thresh1  = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_neigh_default_gc_thresh1
          net_ipv4_neigh_default_gc_thresh2  = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_neigh_default_gc_thresh2
          net_ipv4_neigh_default_gc_thresh3  = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_neigh_default_gc_thresh3
          net_ipv4_tcp_fin_timeout           = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_tcp_fin_timeout
          net_ipv4_tcp_keepalive_intvl       = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_tcp_keepalive_intvl
          net_ipv4_tcp_keepalive_probes      = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_tcp_keepalive_probes
          net_ipv4_tcp_keepalive_time        = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_tcp_keepalive_time
          net_ipv4_tcp_max_syn_backlog       = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_tcp_max_syn_backlog
          net_ipv4_tcp_max_tw_buckets        = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_tcp_max_tw_buckets
          net_ipv4_tcp_tw_reuse              = var.default_node_pool.linux_os_config.sysctl_config.net_ipv4_tcp_tw_reuse
          net_netfilter_nf_conntrack_buckets = var.default_node_pool.linux_os_config.sysctl_config.net_netfilter_nf_conntrack_buckets
          net_netfilter_nf_conntrack_max     = var.default_node_pool.linux_os_config.sysctl_config.net_netfilter_nf_conntrack_max
          vm_max_map_count                   = var.default_node_pool.linux_os_config.sysctl_config.vm_max_map_count
          vm_swappiness                      = var.default_node_pool.linux_os_config.sysctl_config.vm_swappiness
          vm_vfs_cache_pressure              = var.default_node_pool.linux_os_config.sysctl_config.vm_vfs_cache_pressure
        }

        transparent_huge_page_defrag  = var.default_node_pool.linux_os_config.transparent_huge_page_defrag
        transparent_huge_page_enabled = var.default_node_pool.linux_os_config.transparent_huge_page_enabled
    }
    fips_enabled      = var.default_node_pool.fips_enabled
    kubelet_disk_type = var.default_node_pool.kubelet_disk_type
    max_pods          = var.default_node_pool.max_pods
    node_network_profile {
      allowed_host_ports {
        port_start = var.default_node_pool.node_network_profile.allowed_host_ports.port_start
        port_end   = var.default_node_pool.node_network_profile.allowed_host_ports.port_end
        protocol   = var.default_node_pool.node_network_profile.allowed_host_ports.protocol
      }
      application_security_group_ids = var.default_node_pool.node_network_profile.application_security_group_ids
      node_public_ip_tags            = var.default_node_pool.node_network_profile.node_public_ip_tags
    }
    node_public_ip_prefix_id     = var.default_node_pool.node_public_ip_prefix_id
    node_labels                  = var.default_node_pool.node_labels
    only_critical_addons_enabled = var.default_node_pool.only_critical_addons_enabled
    orchestrator_version         = var.default_node_pool.orchestrator_version
    os_disk_size_gb              = var.default_node_pool.os_disk_size_gb
    os_disk_type                 = var.default_node_pool.os_disk_type
    os_sku                       = var.default_node_pool.os_sku
    pod_subnet_id                = var.default_node_pool.pod_subnet_id
    proximity_placement_group_id = var.default_node_pool.proximity_placement_group_id
    scale_down_mode              = var.default_node_pool.scale_down_mode
    snapshot_id                  = var.default_node_pool.snapshot_id
    temporary_name_for_rotation  = var.default_node_pool.temporary_name_for_rotation
    type                         = var.default_node_pool.type
    tags                         = var.default_node_pool.tags
    ultra_ssd_enabled            = var.default_node_pool.ultra_ssd_enabled
    upgrade_settings {
      drain_timeout_in_minutes      = var.default_node_pool.upgrade_settings.drain_timeout_in_minutes
      node_soak_duration_in_minutes = var.default_node_pool.upgrade_settings.node_soak_duration_in_minutes
      max_surge                     = var.default_node_pool.upgrade_settings.max_surge
    }
    vnet_subnet_id   = var.default_node_pool.vnet_subnet_id
    workload_runtime = var.default_node_pool.workload_runtime
    zones            = var.default_node_pool.zones
    max_count        = var.default_node_pool.max_count
    min_count        = var.default_node_pool.min_count
    node_count       = var.default_node_pool.node_count
  }

  dynamic "aci_connector_linux" {
    for_each = var.aci_connector_linux != null ? var.aci_connector_linux : {}
    content {
      subnet_name = var.aci_connector_linux.subnet_name
    }
  }

  dynamic "api_server_access_profile" {
    for_each = var.api_server_access_profile != null ? var.api_server_access_profile : {}
    content {
      authorized_ip_ranges = var.api_server_access_profile.authorized_ip_ranges
    }
  }

  auto_scaler_profile {
    balance_similar_node_groups                   = var.auto_scaler_profile.balance_similar_node_groups
    #daemonset_eviction_for_empty_nodes_enabled    = var.auto_scaler_profile.daemonset_eviction_for_empty_nodes_enabled
    #daemonset_eviction_for_occupied_nodes_enabled = var.auto_scaler_profile.daemonset_eviction_for_occupied_nodes_enabled
    expander                                      = var.auto_scaler_profile.expander
    #ignore_daemonsets_utilization_enabled         = var.auto_scaler_profile.ignore_daemonsets_utilization_enabled
    max_graceful_termination_sec                  = var.auto_scaler_profile.max_graceful_termination_sec
    max_node_provisioning_time                    = var.auto_scaler_profile.max_node_provisioning_time
    max_unready_nodes                             = var.auto_scaler_profile.max_unready_nodes
    max_unready_percentage                        = var.auto_scaler_profile.max_unready_percentage
    new_pod_scale_up_delay                        = var.auto_scaler_profile.new_pod_scale_up_delay
    scale_down_delay_after_add                    = var.auto_scaler_profile.scale_down_delay_after_add
    scale_down_delay_after_delete                 = var.auto_scaler_profile.scale_down_delay_after_delete
    scale_down_delay_after_failure                = var.auto_scaler_profile.scale_down_delay_after_failure
    scan_interval                                 = var.auto_scaler_profile.scan_interval
    scale_down_unneeded                           = var.auto_scaler_profile.scale_down_unneeded
    scale_down_unready                            = var.auto_scaler_profile.scale_down_unready
    scale_down_utilization_threshold              = var.auto_scaler_profile.scale_down_utilization_threshold
    empty_bulk_delete_max                         = var.auto_scaler_profile.empty_bulk_delete_max
    skip_nodes_with_local_storage                 = var.auto_scaler_profile.skip_nodes_with_local_storage
    skip_nodes_with_system_pods                   = var.auto_scaler_profile.skip_nodes_with_system_pods
    
  }

  azure_active_directory_role_based_access_control {
      admin_group_object_ids = var.azure_active_directory_role_based_access_control.admin_group_object_ids
      azure_rbac_enabled     = var.azure_active_directory_role_based_access_control.azure_rbac_enabled
      tenant_id              = var.azure_active_directory_role_based_access_control.tenant_id
    }
  

  dynamic confidential_computing {
    for_each = var.confidential_computing != null ? var.confidential_computing : {}
      content {
        sgx_quote_helper_enabled = var.confidential_computing.sgx_quote_helper_enabled      
      }
  }

  dynamic http_proxy_config {
    for_each = var.http_proxy_config != null ? var.http_proxy_config : {}
    content {
      http_proxy  = var.http_proxy_config.http_proxy
      https_proxy = var.http_proxy_config.https_proxy
      no_proxy    = var.http_proxy_config.no_proxy
    }
  }

   identity {
    type         = var.identity.type
    identity_ids = var.identity.identity_ids
  }

ingress_application_gateway {
      gateway_id   = var.ingress_application_gateway.gateway_id
      gateway_name = var.ingress_application_gateway.gateway_name
      subnet_cidr  = var.ingress_application_gateway.subnet_cidr
      subnet_id    = var.ingress_application_gateway.subnet_id
  }

key_management_service {
      key_vault_key_id         = var.key_management_service.key_vault_key_id
      key_vault_network_access = var.key_management_service.key_vault_network_access
  }

key_vault_secrets_provider {
      secret_rotation_enabled  = var.key_vault_secrets_provider.secret_rotation_enabled
      secret_rotation_interval = var.key_vault_secrets_provider.secret_rotation_interval
    }

kubelet_identity {
      client_id                 = var.kubelet_identity.client_id
      object_id                 = var.kubelet_identity.object_id
      user_assigned_identity_id = var.kubelet_identity.user_assigned_identity_id
  }
  
  linux_profile {
    admin_username = var.linux_profile.admin_username
    ssh_key {
      key_data = var.linux_profile.ssh_key.key_data
    }
  }

  maintenance_window {
    allowed {
      day   = var.maintenance_window.allowed.day
      hours = var.maintenance_window.allowed.hours
    }
    not_allowed {
      end   = var.maintenance_window.not_allowed.end
      start = var.maintenance_window.not_allowed.start
    }
  }

  maintenance_window_auto_upgrade {
    frequency    = var.maintenance_window_auto_upgrade.frequency
    interval     = var.maintenance_window_auto_upgrade.interval
    duration     = var.maintenance_window_auto_upgrade.duration
    day_of_week  = var.maintenance_window_auto_upgrade.day_of_week
    day_of_month = var.maintenance_window_auto_upgrade.day_of_month
    week_index   = var.maintenance_window_auto_upgrade.week_index
    start_time   = var.maintenance_window_auto_upgrade.start_time
    utc_offset   = var.maintenance_window_auto_upgrade.utc_offset
    start_date   = var.maintenance_window_auto_upgrade.start_date
    not_allowed {
      end   = var.maintenance_window_auto_upgrade.not_allowed.end
      start = var.maintenance_window_auto_upgrade.not_allowed.start
    }
  }

  maintenance_window_node_os {
    frequency    = var.maintenance_window_node_os.frequency
    interval     = var.maintenance_window_node_os.interval
    duration     = var.maintenance_window_node_os.duration
    day_of_week  = var.maintenance_window_node_os.day_of_week
    day_of_month = var.maintenance_window_node_os.day_of_month
    week_index   = var.maintenance_window_node_os.week_index
    start_time   = var.maintenance_window_node_os.start_time
    utc_offset   = var.maintenance_window_node_os.utc_offset
    start_date   = var.maintenance_window_node_os.start_date
    not_allowed {
      end   = var.maintenance_window_node_os.not_allowed.end
      start = var.maintenance_window_node_os.not_allowed.start
    }
  }

  microsoft_defender {
    log_analytics_workspace_id = var.microsoft_defender.log_analytics_workspace_id
  }

  monitor_metrics {
    annotations_allowed = var.monitor_metrics.annotations_allowed
    labels_allowed      = var.monitor_metrics.labels_allowed
  }

  network_profile {
    network_plugin      = var.network_profile.network_plugin
    network_mode        = var.network_profile.network_mode
    network_policy      = var.network_profile.network_policy
    dns_service_ip      = var.network_profile.dns_service_ip
    network_data_plane  = var.network_profile.network_data_plane
    network_plugin_mode = var.network_profile.network_plugin_mode
    outbound_type       = var.network_profile.outbound_type
    pod_cidr            = var.network_profile.pod_cidr
    pod_cidrs           = var.network_profile.pod_cidrs
    service_cidr        = var.network_profile.service_cidr
    service_cidrs       = var.network_profile.service_cidrs
    ip_versions         = var.network_profile.ip_versions
    load_balancer_sku   = var.network_profile.load_balancer_sku
    load_balancer_profile {
      #backend_pool_type           = var.network_profile.load_balancer_profile.backend_pool_type
      idle_timeout_in_minutes     = var.network_profile.load_balancer_profile.idle_timeout_in_minutes
      managed_outbound_ip_count   = var.network_profile.load_balancer_profile.managed_outbound_ip_count
      managed_outbound_ipv6_count = var.network_profile.load_balancer_profile.managed_outbound_ipv6_count
      outbound_ip_address_ids     = var.network_profile.load_balancer_profile.outbound_ip_address_ids
      outbound_ip_prefix_ids      = var.network_profile.load_balancer_profile.outbound_ip_prefix_ids
      outbound_ports_allocated    = var.network_profile.load_balancer_profile.outbound_ports_allocated
    }
    nat_gateway_profile {
      idle_timeout_in_minutes   = var.network_profile.nat_gateway_profile.idle_timeout_in_minutes
      managed_outbound_ip_count = var.network_profile.nat_gateway_profile.managed_outbound_ip_count
    }
  }

  oms_agent {
    log_analytics_workspace_id      = var.oms_agent.log_analytics_workspace_id
    msi_auth_for_monitoring_enabled = var.oms_agent.msi_auth_for_monitoring_enabled
  }

  service_mesh_profile {
    mode                             = var.service_mesh_profile.mode
    revisions                        = var.service_mesh_profile.revisions
    internal_ingress_gateway_enabled = var.service_mesh_profile.internal_ingress_gateway_enabled
    external_ingress_gateway_enabled = var.service_mesh_profile.external_ingress_gateway_enabled
    certificate_authority {
      key_vault_id           = var.service_mesh_profile.certificate_authority.key_vault_id
      root_cert_object_name  = var.service_mesh_profile.certificate_authority.root_cert_object_name
      cert_chain_object_name = var.service_mesh_profile.certificate_authority.cert_chain_object_name
      cert_object_name       = var.service_mesh_profile.certificate_authority.cert_object_name
      key_object_name        = var.service_mesh_profile.certificate_authority.key_object_name
    }
  }

  workload_autoscaler_profile {
    keda_enabled                    = var.workload_autoscaler_profile.keda_enabled
    vertical_pod_autoscaler_enabled = var.workload_autoscaler_profile.vertical_pod_autoscaler_enabled
  }

  service_principal {
    client_id     = var.service_principal.client_id
    client_secret = var.service_principal.client_secret
  }

  storage_profile {
    blob_driver_enabled         = var.storage_profile.blob_driver_enabled
    disk_driver_enabled         = var.storage_profile.disk_driver_enabled
    file_driver_enabled         = var.storage_profile.file_driver_enabled
    snapshot_controller_enabled = var.storage_profile.snapshot_controller_enabled
  }

  web_app_routing {
    dns_zone_ids = var.web_app_routing.dns_zone_ids
  }

windows_profile {
    admin_username = var.windows_profile.admin_username
    admin_password = var.windows_profile.admin_password
    license        = var.windows_profile.license
    gmsa {
      dns_server  = var.windows_profile.gmsa.dns_server
      root_domain = var.windows_profile.gmsa.root_domain
    }
  }
}




