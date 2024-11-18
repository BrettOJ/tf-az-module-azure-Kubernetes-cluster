resource_group_name                 = "rg-azure-aks-test"
location                            = "southeastasia"
dns_prefix                          = "aks-test"
dns_prefix_private_cluster          = "aks-private"
automatic_upgrade_channel           = "stable"
azure_policy_enabled                = true
cost_analysis_enabled               = true
disk_encryption_set_id              = null
edge_zone                           = null
http_application_routing_enabled    = true
image_cleaner_enabled               = true
image_cleaner_interval_hours        = 24
kubernetes_version                  = "1.21.2"
local_account_disabled              = false
node_os_upgrade_channel             = "rapid"
node_resource_group                 = "rg-azure-aks-test"
oidc_issuer_enabled                 = false
open_service_mesh_enabled           = false
private_cluster_enabled             = true
private_dns_zone_id                 = ""
private_cluster_public_fqdn_enabled = false
workload_identity_enabled           = false
role_based_access_control_enabled   = true
run_command_enabled                 = true
sku_tier                            = "Paid"
support_plan                        = "Basic"

# Default node pool values 

default_node_pool_name                                                             = "default"
default_node_pool_vm_size                                                          = "Standard_DS2_v2"
default_node_pool_capacity_reservation_group_id                                    = null
default_node_pool_auto_scaling_enabled                                             = true
default_node_pool_host_encryption_enabled                                          = false
default_node_pool_node_public_ip_enabled                                           = false
default_node_pool_gpu_instance                                                     = false
default_node_pool_host_group_id                                                    = null
default_node_pool_kubelet_config_allowed_unsafe_sysctls                            = []
default_node_pool_kubelet_config_container_log_max_line                            = 1000
default_node_pool_kubelet_config_container_log_max_size_mb                         = 10
default_node_pool_kubelet_config_cpu_cfs_quota_enabled                             = true
default_node_pool_kubelet_config_cpu_cfs_quota_period                              = "100ms"
default_node_pool_kubelet_config_cpu_manager_policy                                = "static"
default_node_pool_kubelet_config_image_gc_high_threshold                           = 85
default_node_pool_kubelet_config_image_gc_low_threshold                            = 80
default_node_pool_kubelet_config_pod_max_pid                                       = 100
default_node_pool_kubelet_config_topology_manager_policy                           = "best-effort"
default_node_pool_linux_os_config_swap_file_size_mb                                = 0
default_node_pool_linux_os_config_sysctl_config_fs_aio_max_nr                      = 1048576
default_node_pool_linux_os_config_sysctl_config_fs_file_max                        = 100000
default_node_pool_linux_os_config_sysctl_config_fs_inotify_max_user_watches        = 1048576
default_node_pool_linux_os_config_sysctl_config_fs_nr_open                         = 1048576
default_node_pool_linux_os_config_sysctl_config_kernel_threads_max                 = 515456
default_node_pool_linux_os_config_sysctl_config_net_core_netdev_max_backlog        = 100000
default_node_pool_linux_os_config_sysctl_config_net_core_optmem_max                = 20480
default_node_pool_linux_os_config_sysctl_config_net_core_rmem_default              = 212992
default_node_pool_linux_os_config_sysctl_config_net_core_rmem_max                  = 16777216
default_node_pool_linux_os_config_sysctl_config_net_core_somaxconn                 = 1024
default_node_pool_linux_os_config_sysctl_config_net_core_wmem_default              = 212992
default_node_pool_linux_os_config_sysctl_config_net_core_wmem_max                  = 16777216
default_node_pool_linux_os_config_sysctl_config_net_ipv4_ip_local_port_range_max   = 65535
default_node_pool_linux_os_config_sysctl_config_net_ipv4_ip_local_port_range_min   = 1024
default_node_pool_linux_os_config_sysctl_config_net_ipv4_neigh_default_gc_thresh1  = 4096
default_node_pool_linux_os_config_sysctl_config_net_ipv4_neigh_default_gc_thresh2  = 8192
default_node_pool_linux_os_config_sysctl_config_net_ipv4_neigh_default_gc_thresh3  = 16384
default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_fin_timeout           = 30
default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_keepalive_intvl       = 75
default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_keepalive_probes      = 9
default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_keepalive_time        = 7200
default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_max_syn_backlog       = 20480
default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_max_tw_buckets        = 1440000
default_node_pool_linux_os_config_sysctl_config_net_ipv4_tcp_tw_reuse              = true
default_node_pool_linux_os_config_sysctl_config_net_netfilter_nf_conntrack_buckets = 1048576
default_node_pool_linux_os_config_sysctl_config_net_netfilter_nf_conntrack_max     = 1048576
default_node_pool_linux_os_config_sysctl_config_vm_max_map_count                   = 262144
default_node_pool_linux_os_config_sysctl_config_vm_swappiness                      = 10
default_node_pool_linux_os_config_sysctl_config_vm_vfs_cache_pressure              = 50
default_node_pool_linux_os_config_transparent_huge_page_defrag                     = "madvise"
default_node_pool_linux_os_config_transparent_huge_page_enabled                    = "always"
default_node_pool_fips_enabled                                                     = false
default_node_pool_kubelet_disk_type                                                = "OS"
default_node_pool_max_pods                                                         = 110
default_node_pool_node_network_profile_allowed_host_ports_port_start               = 0
default_node_pool_node_network_profile_allowed_host_ports_port_end                 = 65535
default_node_pool_node_network_profile_allowed_host_ports_protocol                 = "TCP"
default_node_pool_node_network_profile_application_security_group_ids              = []
default_node_pool_node_network_profile_node_public_ip_tags                         = {}
default_node_pool_node_public_ip_prefix_id                                         = null
default_node_pool_node_labels                                                      = {}
default_node_pool_only_critical_addons_enabled                                     = false
default_node_pool_orchestrator_version                                             = "1.21.2"
default_node_pool_os_disk_size_gb                                                  = 128
default_node_pool_os_disk_type                                                     = "Managed"
default_node_pool_os_sku                                                           = "Ubuntu"
default_node_pool_pod_subnet_id                                                    = null
default_node_pool_proximity_placement_group_id                                     = null
default_node_pool_scale_down_mode                                                  = "Delete"
default_node_pool_snapshot_id                                                      = null
default_node_pool_temporary_name_for_rotation                                      = null
default_node_pool_type                                                             = "VirtualMachineScaleSets"
default_node_pool_tags                                                             = {}
default_node_pool_ultra_ssd_enabled                                                = false
default_node_pool_upgrade_settings_drain_timeout_in_minutes                        = 30
default_node_pool_upgrade_settings_node_soak_duration_in_minutes                   = 0
default_node_pool_upgrade_settings_max_surge                                       = 1
default_node_pool_vnet_subnet_id                                                   = null
default_node_pool_workload_runtime                                                 = "OCIContainer"
default_node_pool_zones                                                            = []
default_node_pool_max_count                                                        = 5
default_node_pool_min_count                                                        = 1
default_node_pool_node_count                                                       = 3

# Additional node pool values
aci_connector_linux_subnet_name = "aci-connector-subnet"

api_server_access_profile_authorized_ip_ranges = ["0.0.0.0/0"]

auto_scaler_profile_balance_similar_node_groups                   = true
auto_scaler_profile_daemonset_eviction_for_empty_nodes_enabled    = true
auto_scaler_profile_daemonset_eviction_for_occupied_nodes_enabled = false
auto_scaler_profile_expander                                      = "random"
auto_scaler_profile_ignore_daemonsets_utilization_enabled         = false
auto_scaler_profile_max_graceful_termination_sec                  = 600
auto_scaler_profile_max_node_provisioning_time                    = "15m"
auto_scaler_profile_max_unready_nodes                             = 3
auto_scaler_profile_max_unready_percentage                        = 45
auto_scaler_profile_new_pod_scale_up_delay                        = "0s"
auto_scaler_profile_scale_down_delay_after_add                    = "10m"
auto_scaler_profile_scale_down_delay_after_delete                 = "10s"
auto_scaler_profile_scale_down_delay_after_failure                = "3m"
auto_scaler_profile_scan_interval                                 = "10s"
auto_scaler_profile_scale_down_unneeded                           = "10m"
auto_scaler_profile_scale_down_unready                            = "20m"
auto_scaler_profile_scale_down_utilization_threshold              = 0.5
auto_scaler_profile_empty_bulk_delete_max                         = 10
auto_scaler_profile_skip_nodes_with_local_storage                 = false
auto_scaler_profile_skip_nodes_with_system_pods                   = true

azure_active_directory_role_based_access_control_admin_group_object_ids = ["<admin-group-object-id>"]
azure_active_directory_role_based_access_control_azure_rbac_enabled     = true
azure_active_directory_role_based_access_control_tenant_id              = "<tenant-id>"

confidential_computing_sgx_quote_helper_enabled = false

http_proxy_config_http_proxy  = null
http_proxy_config_https_proxy = null
http_proxy_config_no_proxy    = null

identity_type         = "SystemAssigned"
identity_identity_ids = []

ingress_application_gateway_gateway_id   = "<gateway-id>"
ingress_application_gateway_gateway_name = "app-gateway"
ingress_application_gateway_subnet_cidr  = "10.0.0.0/24"
ingress_application_gateway_subnet_id    = "<subnet-id>"

key_management_service_key_vault_key_id         = "<key-vault-key-id>"
key_management_service_key_vault_network_access = "Public"

key_vault_secrets_provider_secret_rotation_enabled  = true
key_vault_secrets_provider_secret_rotation_interval = "30d"

kubelet_identity_client_id                 = "<client-id>"
kubelet_identity_object_id                 = "<object-id>"
kubelet_identity_user_assigned_identity_id = "<user-assigned-identity-id>"

linux_profile_admin_username   = "azureuser"
linux_profile_ssh_key_key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."

maintenance_window_allowed_day       = "Saturday"
maintenance_window_allowed_hours     = [1,2]
maintenance_window_not_allowed_end   = "23:59"
maintenance_window_not_allowed_start = "00:00"

maintenance_window_auto_upgrade_frequency         = "Weekly"
maintenance_window_auto_upgrade_interval          = 1
maintenance_window_auto_upgrade_duration          = 4
maintenance_window_auto_upgrade_day_of_week       = "Sunday"
maintenance_window_auto_upgrade_day_of_month      = 1
maintenance_window_auto_upgrade_week_index        = 1
maintenance_window_auto_upgrade_start_time        = "02:00"
maintenance_window_auto_upgrade_utc_offset        = "+00:00"
maintenance_window_auto_upgrade_start_date        = "2023-01-01"
maintenance_window_auto_upgrade_not_allowed_end   = "23:59"
maintenance_window_auto_upgrade_not_allowed_start = "00:00"

maintenance_window_node_os_frequency         = "Monthly"
maintenance_window_node_os_interval          = 1
maintenance_window_node_os_duration          = 6
maintenance_window_node_os_day_of_week       = "Monday"
maintenance_window_node_os_day_of_month      = 15
maintenance_window_node_os_week_index        = 2
maintenance_window_node_os_start_time        = "03:00"
maintenance_window_node_os_utc_offset        = "+00:00"
maintenance_window_node_os_start_date        = "2023-01-01"
maintenance_window_node_os_not_allowed_end   = "23:59"
maintenance_window_node_os_not_allowed_start = "00:00"

microsoft_defender_log_analytics_workspace_id = "<log-analytics-workspace-id>"

monitor_metrics_annotations_allowed = true
monitor_metrics_labels_allowed      = true

network_profile_network_plugin                                    = "azure"
network_profile_network_mode                                      = "transparent"
network_profile_network_policy                                    = "calico"
network_profile_dns_service_ip                                    = "10.0.0.10"
network_profile_network_data_plane                                = "dataplane"
network_profile_network_plugin_mode                               = "overlay"
network_profile_outbound_type                                     = "loadBalancer"
network_profile_pod_cidr                                          = "10.244.0.0/16"
network_profile_pod_cidrs                                         = ["10.244.0.0/16"]
network_profile_service_cidr                                      = "10.0.0.0/16"
network_profile_service_cidrs                                     = ["10.0.0.0/16"]
network_profile_ip_versions                                       = ["IPv4"]
network_profile_load_balancer_sku                                 = "Standard"
network_profile_load_balancer_profile_backend_pool_type           = "nodeIP"
network_profile_load_balancer_profile_idle_timeout_in_minutes     = 30
network_profile_load_balancer_profile_managed_outbound_ip_count   = 1
network_profile_load_balancer_profile_managed_outbound_ipv6_count = 0
network_profile_load_balancer_profile_outbound_ip_address_ids     = []
network_profile_load_balancer_profile_outbound_ip_prefix_ids      = []
network_profile_load_balancer_profile_outbound_ports_allocated    = 1024
network_profile_nat_gateway_profile_idle_timeout_in_minutes       = 4
network_profile_nat_gateway_profile_managed_outbound_ip_count     = 1

oms_agent_log_analytics_workspace_id      = "<log-analytics-workspace-id>"
oms_agent_msi_auth_for_monitoring_enabled = true

service_mesh_profile_mode                                         = "standard"
service_mesh_profile_revisions                                    = ["v1", "v2"]
service_mesh_profile_internal_ingress_gateway_enabled             = true
service_mesh_profile_external_ingress_gateway_enabled             = false
service_mesh_profile_certificate_authority_key_vault_id           = "<key-vault-id>"
service_mesh_profile_certificate_authority_root_cert_object_name  = "root-cert"
service_mesh_profile_certificate_authority_cert_chain_object_name = "cert-chain"
service_mesh_profile_certificate_authority_cert_object_name       = "cert"
service_mesh_profile_certificate_authority_key_object_name        = "key"

workload_autoscaler_profile_keda_enabled                    = true
workload_autoscaler_profile_vertical_pod_autoscaler_enabled = true

service_principal_client_id     = "<client-id>"
service_principal_client_secret = "<client-secret>"

storage_profile_blob_driver_enabled         = true
storage_profile_disk_driver_enabled         = true
storage_profile_file_driver_enabled         = true
storage_profile_snapshot_controller_enabled = true

web_app_routing_dns_zone_ids = ["<dns-zone-id>"]

windows_profile_admin_username   = "azureuser"
windows_profile_admin_password   = "P@ssw0rd!"
windows_profile_license          = "Windows_Server"
windows_profile_gmsa_dns_server  = "10.0.0.4"
windows_profile_gmsa_root_domain = "example.com"
 