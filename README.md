# tf-az-module-azure-Kubernetes-cluster
Terraform module to create an Azure Kubernetes cluster

Manages a Managed Kubernetes Cluster (also known as AKS / Azure Kubernetes Service)

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#example-usage)

This example provisions a basic Managed Kubernetes Cluster. Other examples of the `azurerm_kubernetes_cluster` resource can be found in [the `./examples/kubernetes` directory within the GitHub Repository](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/kubernetes).

An example of how to attach a specific Container Registry to a Managed Kubernetes Cluster can be found in the docs for [azurerm\_container\_registry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry).

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_kubernetes_cluster" "example" { name = "example-aks1" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name dns_prefix = "exampleaks1" default_node_pool { name = "default" node_count = 1 vm_size = "Standard_D2_v2" } identity { type = "SystemAssigned" } tags = { Environment = "Production" } } output "client_certificate" { value = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate sensitive = true } output "kube_config" { value = azurerm_kubernetes_cluster.example.kube_config_raw sensitive = true }
```

## [Argument Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#argument-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#name-1) - (Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created.
    
-   [`location`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#location-1) - (Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created.
    
-   [`resource_group_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#resource_group_name-1) - (Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created.
    
-   [`default_node_pool`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#default_node_pool-1) - (Required) Specifies configuration for "System" mode node pool. A `default_node_pool` block as defined below.
    
-   [`dns_prefix`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#dns_prefix-1) - (Optional) DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length. Changing this forces a new resource to be created.
    
-   [`dns_prefix_private_cluster`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#dns_prefix_private_cluster-1) - (Optional) Specifies the DNS prefix to use with private clusters. Changing this forces a new resource to be created.
    

In addition, one of either `identity` or `service_principal` blocks must be specified.

___

-   [`aci_connector_linux`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#aci_connector_linux-1) - (Optional) A `aci_connector_linux` block as defined below. For more details, please visit [Create and configure an AKS cluster to use virtual nodes](https://docs.microsoft.com/azure/aks/virtual-nodes-portal).
    
-   [`automatic_upgrade_channel`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#automatic_upgrade_channel-1) - (Optional) The upgrade channel for this Kubernetes Cluster. Possible values are `patch`, `rapid`, `node-image` and `stable`. Omitting this field sets this value to `none`.
    

-   [`api_server_access_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#api_server_access_profile-1) - (Optional) An `api_server_access_profile` block as defined below.
    
-   [`auto_scaler_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#auto_scaler_profile-1) - (Optional) A `auto_scaler_profile` block as defined below.
    
-   [`azure_active_directory_role_based_access_control`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#azure_active_directory_role_based_access_control-1) - (Optional) A `azure_active_directory_role_based_access_control` block as defined below.
    
-   [`azure_policy_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#azure_policy_enabled-1) - (Optional) Should the Azure Policy Add-On be enabled? For more details please visit [Understand Azure Policy for Azure Kubernetes Service](https://docs.microsoft.com/en-ie/azure/governance/policy/concepts/rego-for-aks)
    
-   [`confidential_computing`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#confidential_computing-1) - (Optional) A `confidential_computing` block as defined below. For more details please [the documentation](https://learn.microsoft.com/en-us/azure/confidential-computing/confidential-nodes-aks-overview)
    
-   [`cost_analysis_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#cost_analysis_enabled-1) - (Optional) Should cost analysis be enabled for this Kubernetes Cluster? Defaults to `false`. The `sku_tier` must be set to `Standard` or `Premium` to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal.
    
-   [`disk_encryption_set_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#disk_encryption_set_id-1) - (Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created.
    
-   [`edge_zone`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#edge_zone-1) - (Optional) Specifies the Extended Zone (formerly called Edge Zone) within the Azure Region where this Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created.
    
-   [`http_application_routing_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#http_application_routing_enabled-1) - (Optional) Should HTTP Application Routing be enabled?
    

-   [`http_proxy_config`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#http_proxy_config-1) - (Optional) A `http_proxy_config` block as defined below.
    
-   [`identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#identity-1) - (Optional) An `identity` block as defined below. One of either `identity` or `service_principal` must be specified.
    

-   [`image_cleaner_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#image_cleaner_enabled-1) - (Optional) Specifies whether Image Cleaner is enabled.
    
-   [`image_cleaner_interval_hours`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#image_cleaner_interval_hours-1) - (Optional) Specifies the interval in hours when images should be cleaned up. Defaults to `0`.
    
-   [`ingress_application_gateway`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#ingress_application_gateway-1) - (Optional) A `ingress_application_gateway` block as defined below.
    

-   [`key_management_service`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#key_management_service-1) - (Optional) A `key_management_service` block as defined below. For more details, please visit [Key Management Service (KMS) etcd encryption to an AKS cluster](https://learn.microsoft.com/en-us/azure/aks/use-kms-etcd-encryption).
    
-   [`key_vault_secrets_provider`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#key_vault_secrets_provider-1) - (Optional) A `key_vault_secrets_provider` block as defined below. For more details, please visit [Azure Keyvault Secrets Provider for AKS](https://docs.microsoft.com/azure/aks/csi-secrets-store-driver).
    
-   [`kubelet_identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kubelet_identity-1) - (Optional) A `kubelet_identity` block as defined below.
    
-   [`kubernetes_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kubernetes_version-1) - (Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as `1.22` are also supported. - The minor version's latest GA patch is automatically chosen in that case. More details can be found in [the documentation](https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions?tabs=azure-cli#alias-minor-version).
    

-   [`linux_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#linux_profile-1) - (Optional) A `linux_profile` block as defined below.
    
-   [`local_account_disabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#local_account_disabled-1) - (Optional) If `true` local accounts will be disabled. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#disable-local-accounts) for more information.
    

-   [`maintenance_window`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#maintenance_window-1) - (Optional) A `maintenance_window` block as defined below.
    
-   [`maintenance_window_auto_upgrade`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#maintenance_window_auto_upgrade-1) - (Optional) A `maintenance_window_auto_upgrade` block as defined below.
    
-   [`maintenance_window_node_os`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#maintenance_window_node_os-1) - (Optional) A `maintenance_window_node_os` block as defined below.
    
-   [`microsoft_defender`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#microsoft_defender-1) - (Optional) A `microsoft_defender` block as defined below.
    
-   [`monitor_metrics`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#monitor_metrics-1) - (Optional) Specifies a Prometheus add-on profile for the Kubernetes Cluster. A `monitor_metrics` block as defined below.
    

-   [`network_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#network_profile-1) - (Optional) A `network_profile` block as defined below. Changing this forces a new resource to be created.

-   [`node_os_upgrade_channel`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_os_upgrade_channel-1) - (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are `Unmanaged`, `SecurityPatch`, `NodeImage` and `None`. Defaults to `NodeImage`.

-   [`node_resource_group`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_resource_group-1) - (Optional) The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created.

-   [`oidc_issuer_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#oidc_issuer_enabled-1) - (Optional) Enable or Disable the [OIDC issuer URL](https://learn.microsoft.com/en-gb/azure/aks/use-oidc-issuer)
    
-   [`oms_agent`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#oms_agent-1) - (Optional) A `oms_agent` block as defined below.
    
-   [`open_service_mesh_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#open_service_mesh_enabled-1) - (Optional) Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about).
    
-   [`private_cluster_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#private_cluster_enabled-1) - (Optional) Should this Kubernetes Cluster have its API server only exposed on internal IP addresses? This provides a Private IP Address for the Kubernetes API on the Virtual Network where the Kubernetes Cluster is located. Defaults to `false`. Changing this forces a new resource to be created.
    
-   [`private_dns_zone_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#private_dns_zone_id-1) - (Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, `System` to have AKS manage this or `None`. In case of `None` you will need to bring your own DNS server and set up resolving, otherwise, the cluster will have issues after provisioning. Changing this forces a new resource to be created.
    
-   [`private_cluster_public_fqdn_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#private_cluster_public_fqdn_enabled-1) - (Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to `false`.
    

```hcl
resource "azurerm_resource_group" "example" { name = "example" location = "West Europe" } resource "azurerm_private_dns_zone" "example" { name = "privatelink.eastus2.azmk8s.io" resource_group_name = azurerm_resource_group.example.name } resource "azurerm_user_assigned_identity" "example" { name = "aks-example-identity" resource_group_name = azurerm_resource_group.example.name location = azurerm_resource_group.example.location } resource "azurerm_role_assignment" "example" { scope = azurerm_private_dns_zone.example.id role_definition_name = "Private DNS Zone Contributor" principal_id = azurerm_user_assigned_identity.example.principal_id } resource "azurerm_kubernetes_cluster" "example" { name = "aksexamplewithprivatednszone1" location = azurerm_resource_group.example.location resource_group_name = azurerm_resource_group.example.name dns_prefix = "aksexamplednsprefix1" private_cluster_enabled = true private_dns_zone_id = azurerm_private_dns_zone.example.id # rest of configuration omitted for brevity depends_on = [ azurerm_role_assignment.example, ] }
```

-   [`service_mesh_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#service_mesh_profile-1) - (Optional) A `service_mesh_profile` block as defined below.
    
-   [`workload_autoscaler_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#workload_autoscaler_profile-1) - (Optional) A `workload_autoscaler_profile` block defined below.
    
-   [`workload_identity_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#workload_identity_enabled-1) - (Optional) Specifies whether Azure AD Workload Identity should be enabled for the Cluster. Defaults to `false`.
    

-   [`role_based_access_control_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#role_based_access_control_enabled-1) - (Optional) Whether Role Based Access Control for the Kubernetes Cluster should be enabled. Defaults to `true`. Changing this forces a new resource to be created.
    
-   [`run_command_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#run_command_enabled-1) - (Optional) Whether to enable run command for the cluster or not. Defaults to `true`.
    
-   [`service_principal`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#service_principal-1) - (Optional) A `service_principal` block as documented below. One of either `identity` or `service_principal` must be specified.
    

-   [`sku_tier`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#sku_tier-1) - (Optional) The SKU Tier that should be used for this Kubernetes Cluster. Possible values are `Free`, `Standard` (which includes the Uptime SLA) and `Premium`. Defaults to `Free`.

-   [`storage_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#storage_profile-1) - (Optional) A `storage_profile` block as defined below.
    
-   [`support_plan`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#support_plan-1) - (Optional) Specifies the support plan which should be used for this Kubernetes Cluster. Possible values are `KubernetesOfficial` and `AKSLongTermSupport`. Defaults to `KubernetesOfficial`.
    
-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#tags-1) - (Optional) A mapping of tags to assign to the resource.
    
-   [`web_app_routing`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#web_app_routing-1) - (Optional) A `web_app_routing` block as defined below.
    
-   [`windows_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#windows_profile-1) - (Optional) A `windows_profile` block as defined below.
    

___

An `aci_connector_linux` block supports the following:

-   [`subnet_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#subnet_name-1) - (Required) The subnet name for the virtual nodes to run.

```hcl
resource "azurerm_subnet" "virtual" { #... delegation { name = "aciDelegation" service_delegation { name = "Microsoft.ContainerInstance/containerGroups" actions = ["Microsoft.Network/virtualNetworks/subnets/action"] } } }
```

___

An `api_server_access_profile` block supports the following:

-   [`authorized_ip_ranges`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#authorized_ip_ranges-1) - (Optional) Set of authorized IP ranges to allow access to API server, e.g. \["198.51.100.0/24"\].

___

An `auto_scaler_profile` block supports the following:

-   [`balance_similar_node_groups`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#balance_similar_node_groups-1) - (Optional) Detect similar node groups and balance the number of nodes between them. Defaults to `false`.
    
-   [`daemonset_eviction_for_empty_nodes_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#daemonset_eviction_for_empty_nodes_enabled-1) - (Optional) Whether DaemonSet pods will be gracefully terminated from empty nodes. Defaults to `false`.
    
-   [`daemonset_eviction_for_occupied_nodes_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#daemonset_eviction_for_occupied_nodes_enabled-1) - (Optional) Whether DaemonSet pods will be gracefully terminated from non-empty nodes. Defaults to `true`.
    
-   [`expander`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#expander-1) - (Optional) Expander to use. Possible values are `least-waste`, `priority`, `most-pods` and `random`. Defaults to `random`.
    
-   [`ignore_daemonsets_utilization_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#ignore_daemonsets_utilization_enabled-1) - (Optional) Whether DaemonSet pods will be ignored when calculating resource utilization for scale down. Defaults to `false`.
    
-   [`max_graceful_termination_sec`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#max_graceful_termination_sec-1) - (Optional) Maximum number of seconds the cluster autoscaler waits for pod termination when trying to scale down a node. Defaults to `600`.
    
-   [`max_node_provisioning_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#max_node_provisioning_time-1) - (Optional) Maximum time the autoscaler waits for a node to be provisioned. Defaults to `15m`.
    
-   [`max_unready_nodes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#max_unready_nodes-1) - (Optional) Maximum Number of allowed unready nodes. Defaults to `3`.
    
-   [`max_unready_percentage`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#max_unready_percentage-1) - (Optional) Maximum percentage of unready nodes the cluster autoscaler will stop if the percentage is exceeded. Defaults to `45`.
    
-   [`new_pod_scale_up_delay`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#new_pod_scale_up_delay-1) - (Optional) For scenarios like burst/batch scale where you don't want CA to act before the kubernetes scheduler could schedule all the pods, you can tell CA to ignore unscheduled pods before they're a certain age. Defaults to `10s`.
    
-   [`scale_down_delay_after_add`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#scale_down_delay_after_add-1) - (Optional) How long after the scale up of AKS nodes the scale down evaluation resumes. Defaults to `10m`.
    
-   [`scale_down_delay_after_delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#scale_down_delay_after_delete-1) - (Optional) How long after node deletion that scale down evaluation resumes. Defaults to the value used for `scan_interval`.
    
-   [`scale_down_delay_after_failure`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#scale_down_delay_after_failure-1) - (Optional) How long after scale down failure that scale down evaluation resumes. Defaults to `3m`.
    
-   [`scan_interval`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#scan_interval-1) - (Optional) How often the AKS Cluster should be re-evaluated for scale up/down. Defaults to `10s`.
    
-   [`scale_down_unneeded`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#scale_down_unneeded-1) - (Optional) How long a node should be unneeded before it is eligible for scale down. Defaults to `10m`.
    
-   [`scale_down_unready`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#scale_down_unready-1) - (Optional) How long an unready node should be unneeded before it is eligible for scale down. Defaults to `20m`.
    
-   [`scale_down_utilization_threshold`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#scale_down_utilization_threshold-1) - (Optional) Node utilization level, defined as sum of requested resources divided by capacity, below which a node can be considered for scale down. Defaults to `0.5`.
    
-   [`empty_bulk_delete_max`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#empty_bulk_delete_max-1) - (Optional) Maximum number of empty nodes that can be deleted at the same time. Defaults to `10`.
    
-   [`skip_nodes_with_local_storage`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#skip_nodes_with_local_storage-1) - (Optional) If `true` cluster autoscaler will never delete nodes with pods with local storage, for example, EmptyDir or HostPath. Defaults to `true`.
    
-   [`skip_nodes_with_system_pods`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#skip_nodes_with_system_pods-1) - (Optional) If `true` cluster autoscaler will never delete nodes with pods from kube-system (except for DaemonSet or mirror pods). Defaults to `true`.
    

___

An `azure_active_directory_role_based_access_control` block supports the following:

-   [`tenant_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#tenant_id-2) - (Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used.
    
-   [`admin_group_object_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#admin_group_object_ids-1) - (Optional) A list of Object IDs of Azure Active Directory Groups which should have Admin Role on the Cluster.
    
-   [`azure_rbac_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#azure_rbac_enabled-1) - (Optional) Is Role Based Access Control based on Azure AD enabled?
    

___

A `confidential_computing` block supports the following:

-   [`sgx_quote_helper_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#sgx_quote_helper_enabled-1) - (Required) Should the SGX quote helper be enabled?

___

An `monitor_metrics` block supports the following:

-   [`annotations_allowed`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#annotations_allowed-1) - (Optional) Specifies a comma-separated list of Kubernetes annotation keys that will be used in the resource's labels metric.
    
-   [`labels_allowed`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#labels_allowed-1) - (Optional) Specifies a Comma-separated list of additional Kubernetes label keys that will be used in the resource's labels metric.
    

___

A `default_node_pool` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#name-2) - (Required) The name which should be used for the default Kubernetes Node Pool.
    
-   [`vm_size`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#vm_size-1) - (Required) The size of the Virtual Machine, such as `Standard_DS2_v2`. `temporary_name_for_rotation` must be specified when attempting a resize.
    
-   [`capacity_reservation_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#capacity_reservation_group_id-1) - (Optional) Specifies the ID of the Capacity Reservation Group within which this AKS Cluster should be created. Changing this forces a new resource to be created.
    
-   [`auto_scaling_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#auto_scaling_enabled-1) - (Optional) Should [the Kubernetes Auto Scaler](https://docs.microsoft.com/azure/aks/cluster-autoscaler) be enabled for this Node Pool?
    

-   [`host_encryption_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#host_encryption_enabled-1) - (Optional) Should the nodes in the Default Node Pool have host encryption enabled? `temporary_name_for_rotation` must be specified when changing this property.

-   [`node_public_ip_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_public_ip_enabled-1) - (Optional) Should nodes in this Node Pool have a Public IP Address? `temporary_name_for_rotation` must be specified when changing this property.
    
-   [`gpu_instance`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#gpu_instance-1) - (Optional) Specifies the GPU MIG instance profile for supported GPU VM SKU. The allowed values are `MIG1g`, `MIG2g`, `MIG3g`, `MIG4g` and `MIG7g`. Changing this forces a new resource to be created.
    
-   [`host_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#host_group_id-1) - (Optional) Specifies the ID of the Host Group within which this AKS Cluster should be created. Changing this forces a new resource to be created.
    
-   [`kubelet_config`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kubelet_config-1) - (Optional) A `kubelet_config` block as defined below. `temporary_name_for_rotation` must be specified when changing this block.
    
-   [`linux_os_config`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#linux_os_config-1) - (Optional) A `linux_os_config` block as defined below. `temporary_name_for_rotation` must be specified when changing this block.
    
-   [`fips_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#fips_enabled-1) - (Optional) Should the nodes in this Node Pool have Federal Information Processing Standard enabled? `temporary_name_for_rotation` must be specified when changing this block. Changing this forces a new resource to be created.
    
-   [`kubelet_disk_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kubelet_disk_type-1) - (Optional) The type of disk used by kubelet. Possible values are `OS` and `Temporary`.
    
-   [`max_pods`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#max_pods-1) - (Optional) The maximum number of pods that can run on each agent. `temporary_name_for_rotation` must be specified when changing this property.
    
-   [`node_network_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_network_profile-1) - (Optional) A `node_network_profile` block as documented below.
    
-   [`node_public_ip_prefix_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_public_ip_prefix_id-1) - (Optional) Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool. `node_public_ip_enabled` should be `true`. Changing this forces a new resource to be created.
    
-   [`node_labels`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_labels-1) - (Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool.
    
-   [`only_critical_addons_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#only_critical_addons_enabled-1) - (Optional) Enabling this option will taint default node pool with `CriticalAddonsOnly=true:NoSchedule` taint. `temporary_name_for_rotation` must be specified when changing this property.
    
-   [`orchestrator_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#orchestrator_version-1) - (Optional) Version of Kubernetes used for the Agents. If not specified, the default node pool will be created with the version specified by `kubernetes_version`. If both are unspecified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as `1.22` are also supported. - The minor version's latest GA patch is automatically chosen in that case. More details can be found in [the documentation](https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions?tabs=azure-cli#alias-minor-version).
    

-   [`os_disk_size_gb`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#os_disk_size_gb-1) - (Optional) The size of the OS Disk which should be used for each agent in the Node Pool. `temporary_name_for_rotation` must be specified when attempting a change.
    
-   [`os_disk_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#os_disk_type-1) - (Optional) The type of disk which should be used for the Operating System. Possible values are `Ephemeral` and `Managed`. Defaults to `Managed`. `temporary_name_for_rotation` must be specified when attempting a change.
    
-   [`os_sku`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#os_sku-1) - (Optional) Specifies the OS SKU used by the agent pool. Possible values are `AzureLinux`, `Ubuntu`, `Windows2019` and `Windows2022`. If not specified, the default is `Ubuntu` if OSType=Linux or `Windows2019` if OSType=Windows. And the default Windows OSSKU will be changed to `Windows2022` after Windows2019 is deprecated. Changing this from `AzureLinux` or `Ubuntu` to `AzureLinux` or `Ubuntu` will not replace the resource, otherwise `temporary_name_for_rotation` must be specified when attempting a change.
    
-   [`pod_subnet_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#pod_subnet_id-1) - (Optional) The ID of the Subnet where the pods in the default Node Pool should exist.
    
-   [`proximity_placement_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#proximity_placement_group_id-1) - (Optional) The ID of the Proximity Placement Group. Changing this forces a new resource to be created.
    
-   [`scale_down_mode`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#scale_down_mode-1) - (Optional) Specifies the autoscaling behaviour of the Kubernetes Cluster. Allowed values are `Delete` and `Deallocate`. Defaults to `Delete`.
    
-   [`snapshot_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#snapshot_id-1) - (Optional) The ID of the Snapshot which should be used to create this default Node Pool. `temporary_name_for_rotation` must be specified when changing this property.
    
-   [`temporary_name_for_rotation`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#temporary_name_for_rotation-1) - (Optional) Specifies the name of the temporary node pool used to cycle the default node pool for VM resizing.
    
-   [`type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#type-1) - (Optional) The type of Node Pool which should be created. Possible values are `VirtualMachineScaleSets`. Defaults to `VirtualMachineScaleSets`. Changing this forces a new resource to be created.
    

-   [`tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#tags-2) - (Optional) A mapping of tags to assign to the Node Pool.

-   [`ultra_ssd_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#ultra_ssd_enabled-1) - (Optional) Used to specify whether the UltraSSD is enabled in the Default Node Pool. Defaults to `false`. See [the documentation](https://docs.microsoft.com/azure/aks/use-ultra-disks) for more information. `temporary_name_for_rotation` must be specified when attempting a change.
    
-   [`upgrade_settings`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#upgrade_settings-1) - (Optional) A `upgrade_settings` block as documented below.
    
-   [`vnet_subnet_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#vnet_subnet_id-1) - (Optional) The ID of a Subnet where the Kubernetes Node Pool should exist.
    

-   [`workload_runtime`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#workload_runtime-1) - (Optional) Specifies the workload runtime used by the node pool. Possible value is `OCIContainer`.
    
-   [`zones`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#zones-1) - (Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster should be located. `temporary_name_for_rotation` must be specified when changing this property.
    

If `auto_scaling_enabled` is set to `true`, then the following fields can also be configured:

-   [`max_count`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#max_count-1) - (Optional) The maximum number of nodes which should exist in this Node Pool. If specified this must be between `1` and `1000`.
    
-   [`min_count`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#min_count-1) - (Optional) The minimum number of nodes which should exist in this Node Pool. If specified this must be between `1` and `1000`.
    
-   [`node_count`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_count-1) - (Optional) The initial number of nodes which should exist in this Node Pool. If specified this must be between `1` and `1000` and between `min_count` and `max_count`.
    

___

An `identity` block supports the following:

-   [`type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#type-2) - (Required) Specifies the type of Managed Service Identity that should be configured on this Kubernetes Cluster. Possible values are `SystemAssigned` or `UserAssigned`.
    
-   [`identity_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#identity_ids-1) - (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Kubernetes Cluster.
    

___

A `key_management_service` block supports the following:

-   [`key_vault_key_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#key_vault_key_id-1) - (Required) Identifier of Azure Key Vault key. See [key identifier format](https://learn.microsoft.com/en-us/azure/key-vault/general/about-keys-secrets-certificates#vault-name-and-object-name) for more details.
    
-   [`key_vault_network_access`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#key_vault_network_access-1) - (Optional) Network access of the key vault Network access of key vault. The possible values are `Public` and `Private`. `Public` means the key vault allows public access from all networks. `Private` means the key vault disables public access and enables private link. Defaults to `Public`.
    

___

A `key_vault_secrets_provider` block supports the following:

-   [`secret_rotation_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#secret_rotation_enabled-1) - (Optional) Should the secret store CSI driver on the AKS cluster be enabled?
    
-   [`secret_rotation_interval`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#secret_rotation_interval-1) - (Optional) The interval to poll for secret rotation. This attribute is only set when `secret_rotation` is true. Defaults to `2m`.
    

___

A `kubelet_config` block supports the following:

-   [`allowed_unsafe_sysctls`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#allowed_unsafe_sysctls-1) - (Optional) Specifies the allow list of unsafe sysctls command or patterns (ending in `*`).
    
-   [`container_log_max_line`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#container_log_max_line-1) - (Optional) Specifies the maximum number of container log files that can be present for a container. must be at least 2.
    
-   [`container_log_max_size_mb`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#container_log_max_size_mb-1) - (Optional) Specifies the maximum size (e.g. 10MB) of container log file before it is rotated.
    
-   [`cpu_cfs_quota_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#cpu_cfs_quota_enabled-1) - (Optional) Is CPU CFS quota enforcement for containers enabled? Defaults to `true`.
    
-   [`cpu_cfs_quota_period`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#cpu_cfs_quota_period-1) - (Optional) Specifies the CPU CFS quota period value.
    
-   [`cpu_manager_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#cpu_manager_policy-1) - (Optional) Specifies the CPU Manager policy to use. Possible values are `none` and `static`,.
    
-   [`image_gc_high_threshold`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#image_gc_high_threshold-1) - (Optional) Specifies the percent of disk usage above which image garbage collection is always run. Must be between `0` and `100`.
    
-   [`image_gc_low_threshold`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#image_gc_low_threshold-1) - (Optional) Specifies the percent of disk usage lower than which image garbage collection is never run. Must be between `0` and `100`.
    
-   [`pod_max_pid`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#pod_max_pid-1) - (Optional) Specifies the maximum number of processes per pod.
    
-   [`topology_manager_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#topology_manager_policy-1) - (Optional) Specifies the Topology Manager policy to use. Possible values are `none`, `best-effort`, `restricted` or `single-numa-node`.
    

___

The `kubelet_identity` block supports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_id-2) - (Optional) The Client ID of the user-defined Managed Identity to be assigned to the Kubelets. If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.
    
-   [`object_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#object_id-1) - (Optional) The Object ID of the user-defined Managed Identity assigned to the Kubelets.If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.
    
-   [`user_assigned_identity_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#user_assigned_identity_id-1) - (Optional) The ID of the User Assigned Identity assigned to the Kubelets. If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.
    

___

A `linux_os_config` block supports the following:

-   [`swap_file_size_mb`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#swap_file_size_mb-1) - (Optional) Specifies the size of the swap file on each node in MB.
    
-   [`sysctl_config`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#sysctl_config-1) - (Optional) A `sysctl_config` block as defined below.
    
-   [`transparent_huge_page_defrag`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#transparent_huge_page_defrag-1) - (Optional) specifies the defrag configuration for Transparent Huge Page. Possible values are `always`, `defer`, `defer+madvise`, `madvise` and `never`.
    
-   [`transparent_huge_page_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#transparent_huge_page_enabled-1) - (Optional) Specifies the Transparent Huge Page enabled configuration. Possible values are `always`, `madvise` and `never`.
    

___

A `node_network_profile` block supports the following:

-   [`allowed_host_ports`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#allowed_host_ports-1) - (Optional) One or more `allowed_host_ports` blocks as defined below.
    
-   [`application_security_group_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#application_security_group_ids-1) - (Optional) A list of Application Security Group IDs which should be associated with this Node Pool.
    
-   [`node_public_ip_tags`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_public_ip_tags-1) - (Optional) Specifies a mapping of tags to the instance-level public IPs. Changing this forces a new resource to be created.
    

___

An `allowed_host_ports` block supports the following:

-   [`port_start`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#port_start-1) - (Optional) Specifies the start of the port range.
    
-   [`port_end`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#port_end-1) - (Optional) Specifies the end of the port range.
    
-   [`protocol`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#protocol-1) - (Optional) Specifies the protocol of the port range. Possible values are `TCP` and `UDP`.
    

___

A `linux_profile` block supports the following:

-   [`admin_username`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#admin_username-1) - (Required) The Admin Username for the Cluster. Changing this forces a new resource to be created.
    
-   [`ssh_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#ssh_key-1) - (Required) An `ssh_key` block as defined below. Only one is currently allowed. Changing this will update the key on all node pools. More information can be found in [the documentation](https://learn.microsoft.com/en-us/azure/aks/node-access#update-ssh-key-on-an-existing-aks-cluster-preview).
    

___

A `maintenance_window` block supports the following:

-   [`allowed`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#allowed-1) - (Optional) One or more `allowed` blocks as defined below.
    
-   [`not_allowed`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#not_allowed-1) - (Optional) One or more `not_allowed` block as defined below.
    

___

A `maintenance_window_auto_upgrade` block supports the following:

-   [`frequency`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#frequency-1) - (Required) Frequency of maintenance. Possible options are `Weekly`, `AbsoluteMonthly` and `RelativeMonthly`.
    
-   [`interval`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#interval-1) - (Required) The interval for maintenance runs. Depending on the frequency this interval is week or month based.
    
-   [`duration`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#duration-1) - (Required) The duration of the window for maintenance to run in hours. Possible options are between `4` to `24`.
    
-   [`day_of_week`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#day_of_week-1) - (Optional) The day of the week for the maintenance run. Required in combination with weekly frequency. Possible values are `Friday`, `Monday`, `Saturday`, `Sunday`, `Thursday`, `Tuesday` and `Wednesday`.
    
-   [`day_of_month`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#day_of_month-1) - (Optional) The day of the month for the maintenance run. Required in combination with AbsoluteMonthly frequency. Value between 0 and 31 (inclusive).
    
-   [`week_index`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#week_index-1) - (Optional) Specifies on which instance of the allowed days specified in `day_of_week` the maintenance occurs. Options are `First`, `Second`, `Third`, `Fourth`, and `Last`. Required in combination with relative monthly frequency.
    
-   [`start_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#start_time-1) - (Optional) The time for maintenance to begin, based on the timezone determined by `utc_offset`. Format is `HH:mm`.
    
-   [`utc_offset`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#utc_offset-1) - (Optional) Used to determine the timezone for cluster maintenance.
    
-   [`start_date`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#start_date-1) - (Optional) The date on which the maintenance window begins to take effect.
    
-   [`not_allowed`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#not_allowed-2) - (Optional) One or more `not_allowed` block as defined below.
    

___

A `maintenance_window_node_os` block supports the following:

-   [`frequency`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#frequency-2) - (Required) Frequency of maintenance. Possible options are `Daily`, `Weekly`, `AbsoluteMonthly` and `RelativeMonthly`.
    
-   [`interval`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#interval-2) - (Required) The interval for maintenance runs. Depending on the frequency this interval is week or month based.
    
-   [`duration`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#duration-2) - (Required) The duration of the window for maintenance to run in hours. Possible options are between `4` to `24`.
    
-   [`day_of_week`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#day_of_week-2) - (Optional) The day of the week for the maintenance run. Required in combination with weekly frequency. Possible values are `Friday`, `Monday`, `Saturday`, `Sunday`, `Thursday`, `Tuesday` and `Wednesday`.
    
-   [`day_of_month`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#day_of_month-2) - (Optional) The day of the month for the maintenance run. Required in combination with AbsoluteMonthly frequency. Value between 0 and 31 (inclusive).
    
-   [`week_index`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#week_index-2) - (Optional) The week in the month used for the maintenance run. Options are `First`, `Second`, `Third`, `Fourth`, and `Last`.
    
-   [`start_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#start_time-2) - (Optional) The time for maintenance to begin, based on the timezone determined by `utc_offset`. Format is `HH:mm`.
    
-   [`utc_offset`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#utc_offset-2) - (Optional) Used to determine the timezone for cluster maintenance.
    
-   [`start_date`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#start_date-2) - (Optional) The date on which the maintenance window begins to take effect.
    
-   [`not_allowed`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#not_allowed-3) - (Optional) One or more `not_allowed` block as defined below.
    

___

An `allowed` block supports the following:

-   [`day`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#day-1) - (Required) A day in a week. Possible values are `Sunday`, `Monday`, `Tuesday`, `Wednesday`, `Thursday`, `Friday` and `Saturday`.
    
-   [`hours`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#hours-1) - (Required) An array of hour slots in a day. For example, specifying `1` will allow maintenance from 1:00am to 2:00am. Specifying `1`, `2` will allow maintenance from 1:00am to 3:00m. Possible values are between `0` and `23`.
    

___

A `not_allowed` block supports the following:

-   [`end`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#end-1) - (Required) The end of a time span, formatted as an RFC3339 string.
    
-   [`start`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#start-1) - (Required) The start of a time span, formatted as an RFC3339 string.
    

___

A `microsoft_defender` block supports the following:

-   [`log_analytics_workspace_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#log_analytics_workspace_id-1) - (Required) Specifies the ID of the Log Analytics Workspace where the audit logs collected by Microsoft Defender should be sent to.

___

A `network_profile` block supports the following:

-   [`network_plugin`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#network_plugin-1) - (Required) Network plugin to use for networking. Currently supported values are `azure`, `kubenet` and `none`. Changing this forces a new resource to be created.

-   [`network_mode`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#network_mode-1) - (Optional) Network mode to be used with Azure CNI. Possible values are `bridge` and `transparent`. Changing this forces a new resource to be created.

-   [`network_policy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#network_policy-1) - (Optional) Sets up network policy to be used with Azure CNI. [Network policy allows us to control the traffic flow between pods](https://docs.microsoft.com/azure/aks/use-network-policies). Currently supported values are `calico`, `azure` and `cilium`.

-   [`dns_service_ip`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#dns_service_ip-1) - (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created.
    
-   [`network_data_plane`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#network_data_plane-1) - (Optional) Specifies the data plane used for building the Kubernetes network. Possible values are `azure` and `cilium`. Defaults to `azure`. Disabling this forces a new resource to be created.
    

-   [`network_plugin_mode`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#network_plugin_mode-1) - (Optional) Specifies the network plugin mode used for building the Kubernetes network. Possible value is `overlay`.

-   [`outbound_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#outbound_type-1) - (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are `loadBalancer`, `userDefinedRouting`, `managedNATGateway` and `userAssignedNATGateway`. Defaults to `loadBalancer`. More information on supported migration paths for `outbound_type` can be found in [this documentation](https://learn.microsoft.com/azure/aks/egress-outboundtype#updating-outboundtype-after-cluster-creation).
    
-   [`pod_cidr`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#pod_cidr-1) - (Optional) The CIDR to use for pod IP addresses. This field can only be set when `network_plugin` is set to `kubenet` or `network_plugin_mode` is set to `overlay`. Changing this forces a new resource to be created.
    
-   [`pod_cidrs`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#pod_cidrs-1) - (Optional) A list of CIDRs to use for pod IP addresses. For single-stack networking a single IPv4 CIDR is expected. For dual-stack networking an IPv4 and IPv6 CIDR are expected. Changing this forces a new resource to be created.
    
-   [`service_cidr`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#service_cidr-1) - (Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created.
    
-   [`service_cidrs`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#service_cidrs-1) - (Optional) A list of CIDRs to use for Kubernetes services. For single-stack networking a single IPv4 CIDR is expected. For dual-stack networking an IPv4 and IPv6 CIDR are expected. Changing this forces a new resource to be created.
    

Examples of how to use [AKS with Advanced Networking](https://docs.microsoft.com/azure/aks/networking-overview#advanced-networking) can be [found in the `./examples/kubernetes/` directory in the GitHub repository](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples/kubernetes).

-   [`ip_versions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#ip_versions-1) - (Optional) Specifies a list of IP versions the Kubernetes Cluster will use to assign IP addresses to its nodes and pods. Possible values are `IPv4` and/or `IPv6`. `IPv4` must always be specified. Changing this forces a new resource to be created.

-   [`load_balancer_sku`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#load_balancer_sku-1) - (Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are `basic` and `standard`. Defaults to `standard`. Changing this forces a new resource to be created.
    
-   [`load_balancer_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#load_balancer_profile-1) - (Optional) A `load_balancer_profile` block as defined below. This can only be specified when `load_balancer_sku` is set to `standard`. Changing this forces a new resource to be created.
    
-   [`nat_gateway_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#nat_gateway_profile-1) - (Optional) A `nat_gateway_profile` block as defined below. This can only be specified when `load_balancer_sku` is set to `standard` and `outbound_type` is set to `managedNATGateway` or `userAssignedNATGateway`. Changing this forces a new resource to be created.
    

___

A `load_balancer_profile` block supports the following:

-   [`backend_pool_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#backend_pool_type-1) - (Optional) The type of the managed inbound Load Balancer Backend Pool. Possible values are `NodeIP` and `NodeIPConfiguration`. Defaults to `NodeIPConfiguration`. See [the documentation](https://learn.microsoft.com/en-us/azure/aks/load-balancer-standard#change-the-inbound-pool-type) for more information.
    
-   [`idle_timeout_in_minutes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#idle_timeout_in_minutes-1) - (Optional) Desired outbound flow idle timeout in minutes for the cluster load balancer. Must be between `4` and `100` inclusive. Defaults to `30`.
    
-   [`managed_outbound_ip_count`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#managed_outbound_ip_count-1) - (Optional) Count of desired managed outbound IPs for the cluster load balancer. Must be between `1` and `100` inclusive.
    
-   [`managed_outbound_ipv6_count`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#managed_outbound_ipv6_count-1) - (Optional) The desired number of IPv6 outbound IPs created and managed by Azure for the cluster load balancer. Must be in the range of 1 to 100 (inclusive). The default value is 0 for single-stack and 1 for dual-stack.
    

-   [`outbound_ip_address_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#outbound_ip_address_ids-1) - (Optional) The ID of the Public IP Addresses which should be used for outbound communication for the cluster load balancer.

-   [`outbound_ip_prefix_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#outbound_ip_prefix_ids-1) - (Optional) The ID of the outbound Public IP Address Prefixes which should be used for the cluster load balancer.

-   [`outbound_ports_allocated`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#outbound_ports_allocated-1) - (Optional) Number of desired SNAT port for each VM in the clusters load balancer. Must be between `0` and `64000` inclusive. Defaults to `0`.

___

A `nat_gateway_profile` block supports the following:

-   [`idle_timeout_in_minutes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#idle_timeout_in_minutes-2) - (Optional) Desired outbound flow idle timeout in minutes for the managed nat gateway. Must be between `4` and `120` inclusive. Defaults to `4`.
    
-   [`managed_outbound_ip_count`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#managed_outbound_ip_count-2) - (Optional) Count of desired managed outbound IPs for the managed nat gateway. Must be between `1` and `16` inclusive.
    

___

An `oms_agent` block supports the following:

-   [`log_analytics_workspace_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#log_analytics_workspace_id-2) - (Required) The ID of the Log Analytics Workspace which the OMS Agent should send data to.
    
-   [`msi_auth_for_monitoring_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#msi_auth_for_monitoring_enabled-1) - (Optional) Is managed identity authentication for monitoring enabled?
    

___

An `ingress_application_gateway` block supports the following:

-   [`gateway_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#gateway_id-1) - (Optional) The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster. See [this](https://docs.microsoft.com/azure/application-gateway/tutorial-ingress-controller-add-on-existing) page for further details.
    
-   [`gateway_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#gateway_name-1) - (Optional) The name of the Application Gateway to be used or created in the Nodepool Resource Group, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. See [this](https://docs.microsoft.com/azure/application-gateway/tutorial-ingress-controller-add-on-new) page for further details.
    
-   [`subnet_cidr`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#subnet_cidr-1) - (Optional) The subnet CIDR to be used to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. See [this](https://docs.microsoft.com/azure/application-gateway/tutorial-ingress-controller-add-on-new) page for further details.
    
-   [`subnet_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#subnet_id-1) - (Optional) The ID of the subnet on which to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster. See [this](https://docs.microsoft.com/azure/application-gateway/tutorial-ingress-controller-add-on-new) page for further details.
    

___

A `service_mesh_profile` block supports the following:

-   [`mode`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#mode-1) - (Required) The mode of the service mesh. Possible value is `Istio`.
    
-   [`revisions`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#revisions-1) - (Required) Specify 1 or 2 Istio control plane revisions for managing minor upgrades using the canary upgrade process. For example, create the resource with `revisions` set to `["asm-1-20"]`, or leave it empty (the `revisions` will only be known after apply). To start the canary upgrade, change `revisions` to `["asm-1-20", "asm-1-21"]`. To roll back the canary upgrade, revert to `["asm-1-20"]`. To confirm the upgrade, change to `["asm-1-21"]`.
    

-   [`internal_ingress_gateway_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#internal_ingress_gateway_enabled-1) - (Optional) Is Istio Internal Ingress Gateway enabled?
    
-   [`external_ingress_gateway_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#external_ingress_gateway_enabled-1) - (Optional) Is Istio External Ingress Gateway enabled?
    

-   [`certificate_authority`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#certificate_authority-1) - (Optional) A `certificate_authority` block as defined below. When this property is specified, `key_vault_secrets_provider` is also required to be set. This configuration allows you to bring your own root certificate and keys for Istio CA in the Istio-based service mesh add-on for Azure Kubernetes Service.

___

A `certificate_authority` block supports the following:

-   [`key_vault_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#key_vault_id-1) - (Required) The resource ID of the Key Vault.
    
-   [`root_cert_object_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#root_cert_object_name-1) - (Required) The root certificate object name in Azure Key Vault.
    
-   [`cert_chain_object_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#cert_chain_object_name-1) - (Required) The certificate chain object name in Azure Key Vault.
    
-   [`cert_object_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#cert_object_name-1) - (Required) The intermediate certificate object name in Azure Key Vault.
    
-   [`key_object_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#key_object_name-1) - (Required) The intermediate certificate private key object name in Azure Key Vault.
    

___

A `service_principal` block supports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_id-3) - (Required) The Client ID for the Service Principal.
    
-   [`client_secret`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_secret-2) - (Required) The Client Secret for the Service Principal.
    

___

A `ssh_key` block supports the following:

-   [`key_data`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#key_data-1) - (Required) The Public SSH Key used to access the cluster. Changing this forces a new resource to be created.

___

A `storage_profile` block supports the following:

-   [`blob_driver_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#blob_driver_enabled-1) - (Optional) Is the Blob CSI driver enabled? Defaults to `false`.
    
-   [`disk_driver_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#disk_driver_enabled-1) - (Optional) Is the Disk CSI driver enabled? Defaults to `true`.
    
-   [`file_driver_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#file_driver_enabled-1) - (Optional) Is the File CSI driver enabled? Defaults to `true`.
    
-   [`snapshot_controller_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#snapshot_controller_enabled-1) - (Optional) Is the Snapshot Controller enabled? Defaults to `true`.
    

___

A `sysctl_config` block supports the following:

-   [`fs_aio_max_nr`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#fs_aio_max_nr-1) - (Optional) The sysctl setting fs.aio-max-nr. Must be between `65536` and `6553500`.
    
-   [`fs_file_max`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#fs_file_max-1) - (Optional) The sysctl setting fs.file-max. Must be between `8192` and `12000500`.
    
-   [`fs_inotify_max_user_watches`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#fs_inotify_max_user_watches-1) - (Optional) The sysctl setting fs.inotify.max\_user\_watches. Must be between `781250` and `2097152`.
    
-   [`fs_nr_open`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#fs_nr_open-1) - (Optional) The sysctl setting fs.nr\_open. Must be between `8192` and `20000500`.
    
-   [`kernel_threads_max`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kernel_threads_max-1) - (Optional) The sysctl setting kernel.threads-max. Must be between `20` and `513785`.
    
-   [`net_core_netdev_max_backlog`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_core_netdev_max_backlog-1) - (Optional) The sysctl setting net.core.netdev\_max\_backlog. Must be between `1000` and `3240000`.
    
-   [`net_core_optmem_max`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_core_optmem_max-1) - (Optional) The sysctl setting net.core.optmem\_max. Must be between `20480` and `4194304`.
    
-   [`net_core_rmem_default`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_core_rmem_default-1) - (Optional) The sysctl setting net.core.rmem\_default. Must be between `212992` and `134217728`.
    
-   [`net_core_rmem_max`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_core_rmem_max-1) - (Optional) The sysctl setting net.core.rmem\_max. Must be between `212992` and `134217728`.
    
-   [`net_core_somaxconn`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_core_somaxconn-1) - (Optional) The sysctl setting net.core.somaxconn. Must be between `4096` and `3240000`.
    
-   [`net_core_wmem_default`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_core_wmem_default-1) - (Optional) The sysctl setting net.core.wmem\_default. Must be between `212992` and `134217728`.
    
-   [`net_core_wmem_max`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_core_wmem_max-1) - (Optional) The sysctl setting net.core.wmem\_max. Must be between `212992` and `134217728`.
    
-   [`net_ipv4_ip_local_port_range_max`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_ip_local_port_range_max-1) - (Optional) The sysctl setting net.ipv4.ip\_local\_port\_range max value. Must be between `32768` and `65535`.
    
-   [`net_ipv4_ip_local_port_range_min`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_ip_local_port_range_min-1) - (Optional) The sysctl setting net.ipv4.ip\_local\_port\_range min value. Must be between `1024` and `60999`.
    
-   [`net_ipv4_neigh_default_gc_thresh1`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_neigh_default_gc_thresh1-1) - (Optional) The sysctl setting net.ipv4.neigh.default.gc\_thresh1. Must be between `128` and `80000`.
    
-   [`net_ipv4_neigh_default_gc_thresh2`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_neigh_default_gc_thresh2-1) - (Optional) The sysctl setting net.ipv4.neigh.default.gc\_thresh2. Must be between `512` and `90000`.
    
-   [`net_ipv4_neigh_default_gc_thresh3`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_neigh_default_gc_thresh3-1) - (Optional) The sysctl setting net.ipv4.neigh.default.gc\_thresh3. Must be between `1024` and `100000`.
    
-   [`net_ipv4_tcp_fin_timeout`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_tcp_fin_timeout-1) - (Optional) The sysctl setting net.ipv4.tcp\_fin\_timeout. Must be between `5` and `120`.
    
-   [`net_ipv4_tcp_keepalive_intvl`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_tcp_keepalive_intvl-1) - (Optional) The sysctl setting net.ipv4.tcp\_keepalive\_intvl. Must be between `10` and `90`.
    
-   [`net_ipv4_tcp_keepalive_probes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_tcp_keepalive_probes-1) - (Optional) The sysctl setting net.ipv4.tcp\_keepalive\_probes. Must be between `1` and `15`.
    
-   [`net_ipv4_tcp_keepalive_time`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_tcp_keepalive_time-1) - (Optional) The sysctl setting net.ipv4.tcp\_keepalive\_time. Must be between `30` and `432000`.
    
-   [`net_ipv4_tcp_max_syn_backlog`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_tcp_max_syn_backlog-1) - (Optional) The sysctl setting net.ipv4.tcp\_max\_syn\_backlog. Must be between `128` and `3240000`.
    
-   [`net_ipv4_tcp_max_tw_buckets`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_tcp_max_tw_buckets-1) - (Optional) The sysctl setting net.ipv4.tcp\_max\_tw\_buckets. Must be between `8000` and `1440000`.
    
-   [`net_ipv4_tcp_tw_reuse`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_ipv4_tcp_tw_reuse-1) - (Optional) The sysctl setting net.ipv4.tcp\_tw\_reuse.
    
-   [`net_netfilter_nf_conntrack_buckets`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_netfilter_nf_conntrack_buckets-1) - (Optional) The sysctl setting net.netfilter.nf\_conntrack\_buckets. Must be between `65536` and `524288`.
    
-   [`net_netfilter_nf_conntrack_max`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#net_netfilter_nf_conntrack_max-1) - (Optional) The sysctl setting net.netfilter.nf\_conntrack\_max. Must be between `131072` and `2097152`.
    
-   [`vm_max_map_count`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#vm_max_map_count-1) - (Optional) The sysctl setting vm.max\_map\_count. Must be between `65530` and `262144`.
    
-   [`vm_swappiness`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#vm_swappiness-1) - (Optional) The sysctl setting vm.swappiness. Must be between `0` and `100`.
    
-   [`vm_vfs_cache_pressure`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#vm_vfs_cache_pressure-1) - (Optional) The sysctl setting vm.vfs\_cache\_pressure. Must be between `0` and `100`.
    

___

A `web_app_routing` block supports the following:

-   [`dns_zone_ids`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#dns_zone_ids-1) - (Required) Specifies the list of the DNS Zone IDs in which DNS entries are created for applications deployed to the cluster when Web App Routing is enabled. If not using Bring-Your-Own DNS zones this property should be set to an empty list.

___

A `windows_profile` block supports the following:

-   [`admin_username`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#admin_username-2) - (Required) The Admin Username for Windows VMs. Changing this forces a new resource to be created.
    
-   [`admin_password`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#admin_password-1) - (Optional) The Admin Password for Windows VMs. Length must be between 14 and 123 characters.
    
-   [`license`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#license-1) - (Optional) Specifies the type of on-premise license which should be used for Node Pool Windows Virtual Machine. At this time the only possible value is `Windows_Server`.
    
-   [`gmsa`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#gmsa-1) - (Optional) A `gmsa` block as defined below.
    

___

A `gmsa` block supports the following:

-   [`dns_server`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#dns_server-1) - (Required) Specifies the DNS server for Windows gMSA. Set this to an empty string if you have configured the DNS server in the VNet which was used to create the managed cluster.
    
-   [`root_domain`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#root_domain-1) - (Required) Specifies the root domain name for Windows gMSA. Set this to an empty string if you have configured the DNS server in the VNet which was used to create the managed cluster.
    

___

A `workload_autoscaler_profile` block supports the following:

-   [`keda_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#keda_enabled-1) - (Optional) Specifies whether KEDA Autoscaler can be used for workloads.
    
-   [`vertical_pod_autoscaler_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#vertical_pod_autoscaler_enabled-1) - (Optional) Specifies whether Vertical Pod Autoscaler should be enabled.
    

___

A `http_proxy_config` block supports the following:

-   [`http_proxy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#http_proxy-1) - (Optional) The proxy address to be used when communicating over HTTP.
    
-   [`https_proxy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#https_proxy-1) - (Optional) The proxy address to be used when communicating over HTTPS.
    
-   [`no_proxy`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#no_proxy-1) - (Optional) The list of domains that will not use the proxy for communication.
    

-   [`trusted_ca`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#trusted_ca-1) - (Optional) The base64 encoded alternative CA certificate content in PEM format.

___

A `upgrade_settings` block supports the following:

-   [`drain_timeout_in_minutes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#drain_timeout_in_minutes-1) - (Optional) The amount of time in minutes to wait on eviction of pods and graceful termination per node. This eviction wait time honors pod disruption budgets for upgrades. If this time is exceeded, the upgrade fails. Unsetting this after configuring it will force a new resource to be created.
    
-   [`node_soak_duration_in_minutes`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_soak_duration_in_minutes-1) - (Optional) The amount of time in minutes to wait after draining a node and before reimaging and moving on to next node. Defaults to `0`.
    
-   [`max_surge`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#max_surge-1) - (Required) The maximum number or percentage of nodes which will be added to the Node Pool size during an upgrade.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#id-1) - The Kubernetes Managed Cluster ID.
    
-   [`current_kubernetes_version`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#current_kubernetes_version-1) - The current version running on the Azure Kubernetes Managed Cluster.
    
-   [`fqdn`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#fqdn-1) - The FQDN of the Azure Kubernetes Managed Cluster.
    
-   [`private_fqdn`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#private_fqdn-1) - The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster.
    
-   [`portal_fqdn`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#portal_fqdn-1) - The FQDN for the Azure Portal resources when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster.
    
-   [`kube_admin_config`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kube_admin_config-1) - A `kube_admin_config` block as defined below. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled.
    
-   [`kube_admin_config_raw`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kube_admin_config_raw-1) - Raw Kubernetes config for the admin account to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled.
    
-   [`kube_config`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kube_config-1) - A `kube_config` block as defined below.
    
-   [`kube_config_raw`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kube_config_raw-1) - Raw Kubernetes config to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools.
    
-   [`http_application_routing_zone_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#http_application_routing_zone_name-1) - The Zone Name of the HTTP Application Routing.
    
-   [`oidc_issuer_url`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#oidc_issuer_url-1) - The OIDC issuer URL that is associated with the cluster.
    
-   [`node_resource_group`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_resource_group-2) - The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster.
    
-   [`node_resource_group_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#node_resource_group_id-1) - The ID of the Resource Group containing the resources for this Managed Kubernetes Cluster.
    
-   [`network_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#network_profile-2) - A `network_profile` block as defined below.
    
-   [`ingress_application_gateway`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#ingress_application_gateway-2) - An `ingress_application_gateway` block as defined below.
    
-   [`oms_agent`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#oms_agent-2) - An `oms_agent` block as defined below.
    
-   [`key_vault_secrets_provider`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#key_vault_secrets_provider-2) - A `key_vault_secrets_provider` block as defined below.
    

___

The `aci_connector_linux` block exports the following:

-   [`connector_identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#connector_identity-1) - A `connector_identity` block is exported. The exported attributes are defined below.

___

The `connector_identity` block exports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_id-4) - The Client ID of the user-defined Managed Identity used by the ACI Connector.
    
-   [`object_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#object_id-2) - The Object ID of the user-defined Managed Identity used by the ACI Connector.
    
-   [`user_assigned_identity_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#user_assigned_identity_id-2) - The ID of the User Assigned Identity used by the ACI Connector.
    

___

The `kubelet_identity` block exports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_id-5) - The Client ID of the user-defined Managed Identity to be assigned to the Kubelets.
    
-   [`object_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#object_id-3) - The Object ID of the user-defined Managed Identity assigned to the Kubelets.
    
-   [`user_assigned_identity_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#user_assigned_identity_id-3) - The ID of the User Assigned Identity assigned to the Kubelets.
    

___

A `load_balancer_profile` block exports the following:

-   [`effective_outbound_ips`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#effective_outbound_ips-1) - The outcome (resource IDs) of the specified arguments.

___

A `network_profile` block supports the following:

-   [`nat_gateway_profile`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#nat_gateway_profile-2) - A `nat_gateway_profile` block as defined below.

___

A `nat_gateway_profile` block exports the following:

-   [`effective_outbound_ips`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#effective_outbound_ips-2) - The outcome (resource IDs) of the specified arguments.

___

An `identity` block exports the following:

-   [`principal_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#principal_id-1) - The Principal ID associated with this Managed Service Identity.
    
-   [`tenant_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#tenant_id-3) - The Tenant ID associated with this Managed Service Identity.
    

___

The `kube_admin_config` and `kube_config` blocks export the following:

-   [`client_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_key-1) - Base64 encoded private key used by clients to authenticate to the Kubernetes cluster.
    
-   [`client_certificate`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_certificate-2) - Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster.
    
-   [`cluster_ca_certificate`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#cluster_ca_certificate-1) - Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster.
    
-   [`host`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#host-1) - The Kubernetes cluster server host.
    
-   [`username`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#username-1) - A username used to authenticate to the Kubernetes cluster.
    
-   [`password`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#password-1) - A password or token used to authenticate to the Kubernetes cluster.
    

```hcl
provider "kubernetes" { host = azurerm_kubernetes_cluster.main.kube_config[0].host username = azurerm_kubernetes_cluster.main.kube_config[0].username password = azurerm_kubernetes_cluster.main.kube_config[0].password client_certificate = base64decode(azurerm_kubernetes_cluster.main.kube_config[0].client_certificate) client_key = base64decode(azurerm_kubernetes_cluster.main.kube_config[0].client_key) cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.main.kube_config[0].cluster_ca_certificate) }
```

___

The `ingress_application_gateway` block exports the following:

-   [`effective_gateway_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#effective_gateway_id-1) - The ID of the Application Gateway associated with the ingress controller deployed to this Kubernetes Cluster.
    
-   [`ingress_application_gateway_identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#ingress_application_gateway_identity-1) - An `ingress_application_gateway_identity` block is exported. The exported attributes are defined below.
    

___

The `ingress_application_gateway_identity` block exports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_id-6) - The Client ID of the user-defined Managed Identity used by the Application Gateway.
    
-   [`object_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#object_id-4) - The Object ID of the user-defined Managed Identity used by the Application Gateway.
    
-   [`user_assigned_identity_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#user_assigned_identity_id-4) - The ID of the User Assigned Identity used by the Application Gateway.
    

___

The `oms_agent` block exports the following:

-   [`oms_agent_identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#oms_agent_identity-1) - An `oms_agent_identity` block is exported. The exported attributes are defined below.

___

The `oms_agent_identity` block exports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_id-7) - The Client ID of the user-defined Managed Identity used by the OMS Agents.
    
-   [`object_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#object_id-5) - The Object ID of the user-defined Managed Identity used by the OMS Agents.
    
-   [`user_assigned_identity_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#user_assigned_identity_id-5) - The ID of the User Assigned Identity used by the OMS Agents.
    

___

The `key_vault_secrets_provider` block exports the following:

-   [`secret_identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#secret_identity-1) - An `secret_identity` block is exported. The exported attributes are defined below.

___

The `secret_identity` block exports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_id-8) - The Client ID of the user-defined Managed Identity used by the Secret Provider.
    
-   [`object_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#object_id-6) - The Object ID of the user-defined Managed Identity used by the Secret Provider.
    
-   [`user_assigned_identity_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#user_assigned_identity_id-6) - The ID of the User Assigned Identity used by the Secret Provider.
    

___

A `web_app_routing` block exports the following:

-   [`web_app_routing_identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#web_app_routing_identity-1) - A `web_app_routing_identity` block is exported. The exported attributes are defined below.

___

The `web_app_routing_identity` block exports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#client_id-9) - The Client ID of the user-defined Managed Identity used for Web App Routing.
    
-   [`object_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#object_id-7) - The Object ID of the user-defined Managed Identity used for Web App Routing
    
-   [`user_assigned_identity_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#user_assigned_identity_id-7) - The ID of the User Assigned Identity used for Web App Routing.
    

___

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/language/resources/syntax#operation-timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#create-1) - (Defaults to 90 minutes) Used when creating the Kubernetes Cluster.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#update-1) - (Defaults to 90 minutes) Used when updating the Kubernetes Cluster.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#read-1) - (Defaults to 5 minutes) Used when retrieving the Kubernetes Cluster.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#delete-1) - (Defaults to 90 minutes) Used when deleting the Kubernetes Cluster.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#import)

Managed Kubernetes Clusters can be imported using the `resource id`, e.g.

```shell
terraform import azurerm_kubernetes_cluster.cluster1 /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/group1/providers/Microsoft.ContainerService/managedClusters/cluster1
```