
locals {
  naming_convention_info = {
    env  = "env"
    site = "zn"
    app  = "www"
    name = "003"
  }
  tags = {
    environment = "prd"
  }
}

data "azurerm_client_config" "current" {}

resource "tls_private_key" "ssh_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}


module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}

module "azurerm_user_assigned_identity" {
  source                 = "git::https://github.com/BrettOJ/tf-az-module-auth-user-msi?ref=main"
  resource_group_name    = module.resource_groups.rg_output[1].name
  location               = var.location
  naming_convention_info = local.naming_convention_info
  tags                   = local.tags
}

module "azurerm_key_vault" {
  source = "git::https://github.com/BrettOJ/tf-az-module-azure-key-vault?ref=main"
  resource_group_name = module.resource_groups.rg_output[1].name
  location            = var.location
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment          = true
  enabled_for_disk_encryption     = true
  enabled_for_template_deployment = true
  enable_rbac_authorization       = true
  network_acls = {
      bypass                     = "AzureServices"
      default_action             = "Allow"
      ip_rules                   = null
      virtual_network_subnet_ids = null
  }
  purge_protection_enabled        = true
  public_network_access_enabled   = true
  soft_delete_retention_days      = 7
  tags                   = local.tags
  naming_convention_info = local.naming_convention_info
}

module "azure_key_vault_access_policy_boj" {
    source = "git::https://github.com/BrettOJ/tf-az-module-azure-key-vault-access-policy?ref=main"
    key_vault_id = module.azurerm_key_vault.key_vault_id
    tenant_id    = data.azurerm_client_config.current.tenant_id
    object_id    = data.azurerm_client_config.current.object_id
    application_id = null
    
    certificate_permissions = var.certificate_permissions
    key_permissions         = var.key_permissions
    secret_permissions      = var.secret_permissions
    storage_permissions     = var.storage_permissions
}

module "azurerm_key_vault_key" { 
  source = "git::https://github.com/BrettOJ/tf-az-module-key-vault-key?ref=main"
  key_vault_id = module.azurerm_key_vault.key_vault_id
  key_type     = var.key_type
  key_size     = var.key_size
  curve = var.curve
  key_opts = var.key_opts
  not_before_date = var.not_before_date
  expiration_date = var.expiration_date
  tags = local.tags
  naming_convention_info = local.naming_convention_info

  rotation_policy = {
    automatic = {
      time_before_expiry = var.rotation_policy_automatic_time_before_expiry
      time_after_creation = var.rotation_policy_automatic_time_after_creation
    }
    expire_after         = var.rotation_policy_expire_after
    notify_before_expiry = var.rotation_policy_notify_before_expiry
  }
}

module "azurerm_log_analytics_workspace" {
  source                                  = "git::https://github.com/BrettOJ/tf-az-module-azure-log-analytics-workspace?ref=main"
  location                                = var.location
  resource_group_name                     = module.resource_groups.rg_output[1].name
  allow_resource_only_permissions         = var.allow_resource_only_permissions
  local_authentication_disabled           = var.local_authentication_disabled
  sku                                     = var.sku
  retention_in_days                       = var.retention_in_days
  daily_quota_gb                          = var.daily_quota_gb
  cmk_for_query_forced                    = var.cmk_for_query_forced
  internet_ingestion_enabled              = var.internet_ingestion_enabled
  internet_query_enabled                  = var.internet_query_enabled
  reservation_capacity_in_gb_per_day      = var.reservation_capacity_in_gb_per_day
  data_collection_rule_id                 = var.data_collection_rule_id
  immediate_data_purge_on_30_days_enabled = var.immediate_data_purge_on_30_days_enabled
  tags                                    = local.tags
  naming_convention_info                  = local.naming_convention_info

  identity = {
    type         = "SystemAssigned"
    identity_ids = null
  }
}


module "azure_kubernetes_cluster" {
  source                              = "../"
  location                            = var.location
  resource_group_name                 = module.resource_groups.rg_output[1].name
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
  open_service_mesh_enabled           = var.open_service_mesh_enabled
  private_cluster_enabled             = var.private_cluster_enabled
  private_dns_zone_id                 = var.private_dns_zone_id
  private_cluster_public_fqdn_enabled = var.private_cluster_public_fqdn_enabled
  workload_identity_enabled           = var.workload_identity_enabled
  role_based_access_control_enabled   = var.role_based_access_control_enabled
  run_command_enabled                 = var.run_command_enabled
  sku_tier                            = var.sku_tier
  support_plan                        = var.support_plan
  tags                                = local.tags
  naming_convention_info              = local.naming_convention_info

  default_node_pool = {
    name                          = var.default_node_pool_name
    vm_size                       = var.default_node_pool_vm_size
    capacity_reservation_group_id = var.default_node_pool_capacity_reservation_group_id
    auto_scaling_enabled          = var.default_node_pool_auto_scaling_enabled
    host_encryption_enabled       = var.default_node_pool_host_encryption_enabled
    node_public_ip_enabled        = var.default_node_pool_node_public_ip_enabled
    gpu_instance                  = var.default_node_pool_gpu_instance
    host_group_id                 = var.default_node_pool_host_group_id
    kubelet_config = {
      allowed_unsafe_sysctls    = var.default_node_pool_kubelet_config_allowed_unsafe_sysctls
      container_log_max_line    = var.default_node_pool_kubelet_config_container_log_max_line
      container_log_max_size_mb = var.default_node_pool_kubelet_config_container_log_max_size_mb
      cpu_cfs_quota_enabled     = var.default_node_pool_kubelet_config_cpu_cfs_quota_enabled
      cpu_cfs_quota_period      = var.default_node_pool_kubelet_config_cpu_cfs_quota_period
      cpu_manager_policy        = var.default_node_pool_kubelet_config_cpu_manager_policy
      image_gc_high_threshold   = var.default_node_pool_kubelet_config_image_gc_high_threshold
      image_gc_low_threshold    = var.default_node_pool_kubelet_config_image_gc_low_threshold
      pod_max_pid               = var.default_node_pool_kubelet_config_pod_max_pid
      topology_manager_policy   = var.default_node_pool_kubelet_config_topology_manager_policy
    }
    linux_os_config = {
      swap_file_size_mb = var.default_node_pool_linux_os_config_swap_file_size_mb
      sysctl_config = {
        fs_aio_max_nr                      = var.default_node_pool_linux_os_config_sysctl_config_fs_aio_max_nr
        fs_file_max                        = var.default_node_pool_linux_os_config_sysctl_config_fs_file_max
        fs_inotify_max_user_watches        = var.default_node_pool_linux_os_config_sysctl_config_fs_inotify_max_user_watches
        fs_nr_open                         = var.default_node_pool_linux_os_config_sysctl_config_fs_nr_open
        kernel_threads_max                 = var.default_node_pool_linux_os_config_sysctl_config_kernel_threads_max
        net_core_netdev_max_backlog        = var.default_node_pool_linux_os_config_sysctl_config_net_core_netdev_max_backlog
        net_core_optmem_max                = var.default_node_pool_linux_os_config_sysctl_config_net_core_optmem_max
        net_core_rmem_default              = var.default_node_pool_linux_os_config_sysctl_config_net_core_rmem_default
        net_core_rmem_max                  = var.default_node_pool_linux_os_config_sysctl_config_net_core_rmem_max
        net_core_somaxconn                 = var.default_node_pool_linux_os_config_sysctl_config_net_core_somaxconn
        net_core_wmem_default              = var.default_node_pool_linux_os_config_sysctl_config_net_core_wmem_default
        net_core_wmem_max                  = var.default_node_pool_linux_os_config_sysctl_config_net_core_wmem_max
        net_ipv4_ip_local_port_range_max   = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_ip_local_port_range_max
        net_ipv4_ip_local_port_range_min   = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_ip_local_port_range_min
        net_ipv4_neigh_default_gc_thresh1  = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_neigh_default_gc_thresh1
        net_ipv4_neigh_default_gc_thresh2  = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_neigh_default_gc_thresh2
        net_ipv4_neigh_default_gc_thresh3  = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_neigh_default_gc_thresh3
        net_ipv4_tcp_fin_timeout           = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_fin_timeout
        net_ipv4_tcp_keepalive_intvl       = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_keepalive_intvl
        net_ipv4_tcp_keepalive_probes      = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_keepalive_probes
        net_ipv4_tcp_keepalive_time        = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_keepalive_time
        net_ipv4_tcp_max_syn_backlog       = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_max_syn_backlog
        net_ipv4_tcp_max_tw_buckets        = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_max_tw_buckets
        net_ipv4_tcp_tw_reuse              = var.default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_tw_reuse
        net_netfilter_nf_conntrack_buckets = var.default_node_pool_linux_os_config_sysctl_config_net_netfilter_nf_conntrack_buckets
        net_netfilter_nf_conntrack_max     = var.default_node_pool_linux_os_config_sysctl_config_net_netfilter_nf_conntrack_max
        vm_max_map_count                   = var.default_node_pool_linux_os_config_sysctl_config_vm_max_map_count
        vm_swappiness                      = var.default_node_pool_linux_os_config_sysctl_config_vm_swappiness
        vm_vfs_cache_pressure              = var.default_node_pool_linux_os_config_sysctl_config_vm_vfs_cache_pressure
      }

      transparent_huge_page_defrag  = var.default_node_pool_linux_os_config_transparent_huge_page_defrag
      transparent_huge_page_enabled = var.default_node_pool_linux_os_config_transparent_huge_page_enabled
    }
    fips_enabled      = var.default_node_pool_fips_enabled
    kubelet_disk_type = var.default_node_pool_kubelet_disk_type
    max_pods          = var.default_node_pool_max_pods
    node_network_profile = {
      allowed_host_ports = {
        port_start = var.default_node_pool_node_network_profile_allowed_host_ports_port_start
        port_end   = var.default_node_pool_node_network_profile_allowed_host_ports_port_end
        protocol   = var.default_node_pool_node_network_profile_allowed_host_ports_protocol
      }
      application_security_group_ids = var.default_node_pool_node_network_profile_application_security_group_ids
      node_public_ip_tags            = var.default_node_pool_node_network_profile_node_public_ip_tags
    }
    node_public_ip_prefix_id     = var.default_node_pool_node_public_ip_prefix_id
    node_labels                  = var.default_node_pool_node_labels
    only_critical_addons_enabled = var.default_node_pool_only_critical_addons_enabled
    orchestrator_version         = var.default_node_pool_orchestrator_version
    os_disk_size_gb              = var.default_node_pool_os_disk_size_gb
    os_disk_type                 = var.default_node_pool_os_disk_type
    os_sku                       = var.default_node_pool_os_sku
    pod_subnet_id                = var.default_node_pool_pod_subnet_id
    proximity_placement_group_id = var.default_node_pool_proximity_placement_group_id
    scale_down_mode              = var.default_node_pool_scale_down_mode
    snapshot_id                  = var.default_node_pool_snapshot_id
    temporary_name_for_rotation  = var.default_node_pool_temporary_name_for_rotation
    type                         = var.default_node_pool_type
    tags                         = var.default_node_pool_tags
    ultra_ssd_enabled            = var.default_node_pool_ultra_ssd_enabled
    upgrade_settings = {
      drain_timeout_in_minutes      = var.default_node_pool_upgrade_settings_drain_timeout_in_minutes
      node_soak_duration_in_minutes = var.default_node_pool_upgrade_settings_node_soak_duration_in_minutes
      max_surge                     = var.default_node_pool_upgrade_settings_max_surge
    }
    vnet_subnet_id   = var.default_node_pool_vnet_subnet_id
    workload_runtime = var.default_node_pool_workload_runtime
    zones            = var.default_node_pool_zones
    max_count        = var.default_node_pool_max_count
    min_count        = var.default_node_pool_min_count
    node_count       = var.default_node_pool_node_count
  }

  aci_connector_linux = {
    subnet_name = var.aci_connector_linux_subnet_name
  }

  api_server_access_profile = {
    authorized_ip_ranges = var.api_server_access_profile_authorized_ip_ranges
  }

  auto_scaler_profile = {
    balance_similar_node_groups                   = var.auto_scaler_profile_balance_similar_node_groups
    daemonset_eviction_for_empty_nodes_enabled    = var.auto_scaler_profile_daemonset_eviction_for_empty_nodes_enabled
    daemonset_eviction_for_occupied_nodes_enabled = var.auto_scaler_profile_daemonset_eviction_for_occupied_nodes_enabled
    expander                                      = var.auto_scaler_profile_expander
    ignore_daemonsets_utilization_enabled         = var.auto_scaler_profile_ignore_daemonsets_utilization_enabled
    max_graceful_termination_sec                  = var.auto_scaler_profile_max_graceful_termination_sec
    max_node_provisioning_time                    = var.auto_scaler_profile_max_node_provisioning_time
    max_unready_nodes                             = var.auto_scaler_profile_max_unready_nodes
    max_unready_percentage                        = var.auto_scaler_profile_max_unready_percentage
    new_pod_scale_up_delay                        = var.auto_scaler_profile_new_pod_scale_up_delay
    scale_down_delay_after_add                    = var.auto_scaler_profile_scale_down_delay_after_add
    scale_down_delay_after_delete                 = var.auto_scaler_profile_scale_down_delay_after_delete
    scale_down_delay_after_failure                = var.auto_scaler_profile_scale_down_delay_after_failure
    scan_interval                                 = var.auto_scaler_profile_scan_interval
    scale_down_unneeded                           = var.auto_scaler_profile_scale_down_unneeded
    scale_down_unready                            = var.auto_scaler_profile_scale_down_unready
    scale_down_utilization_threshold              = var.auto_scaler_profile_scale_down_utilization_threshold
    empty_bulk_delete_max                         = var.auto_scaler_profile_empty_bulk_delete_max
    skip_nodes_with_local_storage                 = var.auto_scaler_profile_skip_nodes_with_local_storage
    skip_nodes_with_system_pods                   = var.auto_scaler_profile_skip_nodes_with_system_pods
  }

  azure_active_directory_role_based_access_control = {
    admin_group_object_ids = var.azure_active_directory_role_based_access_control_admin_group_object_ids
    azure_rbac_enabled     = var.azure_active_directory_role_based_access_control_azure_rbac_enabled
    tenant_id              = var.azure_active_directory_role_based_access_control_tenant_id
  }


  confidential_computing = {
    sgx_quote_helper_enabled = var.confidential_computing_sgx_quote_helper_enabled
  }

  identity = {
    type         = var.identity_type
    identity_ids = [module.azurerm_user_assigned_identity.msi_output.id]
  }
  key_management_service = {
    key_vault_key_id         = module.azurerm_key_vault_key.akv_key_output.id
    key_vault_network_access = var.key_management_service_key_vault_network_access
  }

  key_vault_secrets_provider = {
    secret_rotation_enabled  = var.key_vault_secrets_provider_secret_rotation_enabled
    secret_rotation_interval = var.key_vault_secrets_provider_secret_rotation_interval
  }

/*
  kubelet_identity = {
    client_id                 = module.azurerm_user_assigned_identity.msi_output.client_id
    object_id                 = null
    user_assigned_identity_id = module.azurerm_user_assigned_identity.msi_output.id
  }*/

  linux_profile = {
    admin_username = var.linux_profile_admin_username
    ssh_key = {
      key_data = tls_private_key.ssh_key.public_key_openssh
    }
  }

  maintenance_window = {
    allowed = {
      day   = var.maintenance_window_allowed_day
      hours = var.maintenance_window_allowed_hours
    }
    not_allowed = {
      end   = var.maintenance_window_not_allowed_end
      start = var.maintenance_window_not_allowed_start
    }
  }

  maintenance_window_auto_upgrade = {
    frequency    = var.maintenance_window_auto_upgrade_frequency
    interval     = var.maintenance_window_auto_upgrade_interval
    duration     = var.maintenance_window_auto_upgrade_duration
    day_of_week  = var.maintenance_window_auto_upgrade_day_of_week
    day_of_month = var.maintenance_window_auto_upgrade_day_of_month
    week_index   = var.maintenance_window_auto_upgrade_week_index
    start_time   = var.maintenance_window_auto_upgrade_start_time
    utc_offset   = var.maintenance_window_auto_upgrade_utc_offset
    start_date   = var.maintenance_window_auto_upgrade_start_date
    not_allowed = {
      end   = var.maintenance_window_auto_upgrade_not_allowed_end
      start = var.maintenance_window_auto_upgrade_not_allowed_start
    }
  }

  maintenance_window_node_os = {
    frequency    = var.maintenance_window_node_os_frequency
    interval     = var.maintenance_window_node_os_interval
    duration     = var.maintenance_window_node_os_duration
    day_of_week  = var.maintenance_window_node_os_day_of_week
    day_of_month = var.maintenance_window_node_os_day_of_month
    week_index   = var.maintenance_window_node_os_week_index
    start_time   = var.maintenance_window_node_os_start_time
    utc_offset   = var.maintenance_window_node_os_utc_offset
    start_date   = var.maintenance_window_node_os_start_date
    not_allowed = {
      end   = var.maintenance_window_node_os_not_allowed_end
      start = var.maintenance_window_node_os_not_allowed_start
    }
  }

  microsoft_defender = {
    log_analytics_workspace_id = module.azurerm_log_analytics_workspace.law_output.id
  }

  monitor_metrics = {
    annotations_allowed = var.monitor_metrics_annotations_allowed
    labels_allowed      = var.monitor_metrics_labels_allowed
  }

  network_profile = {
    network_plugin      = var.network_profile_network_plugin
    network_mode        = var.network_profile_network_mode
    network_policy      = var.network_profile_network_policy
    dns_service_ip      = var.network_profile_dns_service_ip
    network_data_plane  = var.network_profile_network_data_plane
    network_plugin_mode = var.network_profile_network_plugin_mode
    outbound_type       = var.network_profile_outbound_type
    pod_cidr            = var.network_profile_pod_cidr
    pod_cidrs           = var.network_profile_pod_cidrs
    service_cidr        = var.network_profile_service_cidr
    service_cidrs       = var.network_profile_service_cidrs
    ip_versions         = var.network_profile_ip_versions
    load_balancer_sku   = var.network_profile_load_balancer_sku
    load_balancer_profile = null
    nat_gateway_profile = null
  }

  oms_agent = {
    log_analytics_workspace_id      = module.azurerm_log_analytics_workspace.law_output.id
    msi_auth_for_monitoring_enabled = var.oms_agent_msi_auth_for_monitoring_enabled
  }

  workload_autoscaler_profile = {
    keda_enabled                    = var.workload_autoscaler_profile_keda_enabled
    vertical_pod_autoscaler_enabled = var.workload_autoscaler_profile_vertical_pod_autoscaler_enabled
  }


  storage_profile = {
    blob_driver_enabled         = var.storage_profile_blob_driver_enabled
    disk_driver_enabled         = var.storage_profile_disk_driver_enabled
    file_driver_enabled         = var.storage_profile_file_driver_enabled
    snapshot_controller_enabled = var.storage_profile_snapshot_controller_enabled
  }

  windows_profile = {
    admin_username = var.windows_profile_admin_username
    admin_password = var.windows_profile_admin_password
    license        = var.windows_profile_license
    gmsa = {
      dns_server  = var.windows_profile_gmsa_dns_server
      root_domain = var.windows_profile_gmsa_root_domain
    }
  }

depends_on = [ module.azure_role_assignment ]

}



