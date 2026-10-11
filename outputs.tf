output "access_points_id" {
  description = "Map of id values across all access_points, keyed the same as var.access_points except keys with no id are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => v.id if v.id != null && length(v.id) > 0 }
}
output "access_points_aws_egress_private_link_endpoint" {
  description = "Map of aws_egress_private_link_endpoint values across all access_points, keyed the same as var.access_points except keys with no aws_egress_private_link_endpoint are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.aws_egress_private_link_endpoint) if v.aws_egress_private_link_endpoint != null && length(v.aws_egress_private_link_endpoint) > 0 }
}
output "access_points_aws_ingress_private_link_endpoint" {
  description = "Map of aws_ingress_private_link_endpoint values across all access_points, keyed the same as var.access_points except keys with no aws_ingress_private_link_endpoint are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.aws_ingress_private_link_endpoint) if v.aws_ingress_private_link_endpoint != null && length(v.aws_ingress_private_link_endpoint) > 0 }
}
output "access_points_aws_private_network_interface" {
  description = "Map of aws_private_network_interface values across all access_points, keyed the same as var.access_points except keys with no aws_private_network_interface are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.aws_private_network_interface) if v.aws_private_network_interface != null && length(v.aws_private_network_interface) > 0 }
}
output "access_points_azure_egress_private_link_endpoint" {
  description = "Map of azure_egress_private_link_endpoint values across all access_points, keyed the same as var.access_points except keys with no azure_egress_private_link_endpoint are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.azure_egress_private_link_endpoint) if v.azure_egress_private_link_endpoint != null && length(v.azure_egress_private_link_endpoint) > 0 }
}
output "access_points_azure_ingress_private_link_endpoint" {
  description = "Map of azure_ingress_private_link_endpoint values across all access_points, keyed the same as var.access_points except keys with no azure_ingress_private_link_endpoint are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.azure_ingress_private_link_endpoint) if v.azure_ingress_private_link_endpoint != null && length(v.azure_ingress_private_link_endpoint) > 0 }
}
output "access_points_display_name" {
  description = "Map of display_name values across all access_points, keyed the same as var.access_points except keys with no display_name are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "access_points_environment" {
  description = "Map of environment values across all access_points, keyed the same as var.access_points except keys with no environment are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.environment) if v.environment != null && length(v.environment) > 0 }
}
output "access_points_gateway" {
  description = "Map of gateway values across all access_points, keyed the same as var.access_points except keys with no gateway are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.gateway) if v.gateway != null && length(v.gateway) > 0 }
}
output "access_points_gcp_egress_private_service_connect_endpoint" {
  description = "Map of gcp_egress_private_service_connect_endpoint values across all access_points, keyed the same as var.access_points except keys with no gcp_egress_private_service_connect_endpoint are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.gcp_egress_private_service_connect_endpoint) if v.gcp_egress_private_service_connect_endpoint != null && length(v.gcp_egress_private_service_connect_endpoint) > 0 }
}
output "access_points_gcp_ingress_private_service_connect_endpoint" {
  description = "Map of gcp_ingress_private_service_connect_endpoint values across all access_points, keyed the same as var.access_points except keys with no gcp_ingress_private_service_connect_endpoint are omitted"
  value       = { for k, v in confluent_access_point.access_points : k => one(v.gcp_ingress_private_service_connect_endpoint) if v.gcp_ingress_private_service_connect_endpoint != null && length(v.gcp_ingress_private_service_connect_endpoint) > 0 }
}

