resource "confluent_access_point" "access_points" {
  for_each = var.access_points

  display_name = each.value.display_name

  environment {
    id = each.value.environment.id
  }

  gateway {
    id = each.value.gateway.id
  }

  dynamic "aws_egress_private_link_endpoint" {
    for_each = each.value.aws_egress_private_link_endpoint != null ? [each.value.aws_egress_private_link_endpoint] : []
    content {
      enable_high_availability  = aws_egress_private_link_endpoint.value.enable_high_availability
      vpc_endpoint_service_name = aws_egress_private_link_endpoint.value.vpc_endpoint_service_name
    }
  }

  dynamic "aws_ingress_private_link_endpoint" {
    for_each = each.value.aws_ingress_private_link_endpoint != null ? [each.value.aws_ingress_private_link_endpoint] : []
    content {
      vpc_endpoint_id = aws_ingress_private_link_endpoint.value.vpc_endpoint_id
    }
  }

  dynamic "aws_private_network_interface" {
    for_each = each.value.aws_private_network_interface != null ? [each.value.aws_private_network_interface] : []
    content {
      account            = aws_private_network_interface.value.account
      network_interfaces = aws_private_network_interface.value.network_interfaces
      routes             = aws_private_network_interface.value.routes
    }
  }

  dynamic "azure_egress_private_link_endpoint" {
    for_each = each.value.azure_egress_private_link_endpoint != null ? [each.value.azure_egress_private_link_endpoint] : []
    content {
      private_link_service_resource_id = azure_egress_private_link_endpoint.value.private_link_service_resource_id
      private_link_subresource_name    = azure_egress_private_link_endpoint.value.private_link_subresource_name
    }
  }

  dynamic "azure_ingress_private_link_endpoint" {
    for_each = each.value.azure_ingress_private_link_endpoint != null ? [each.value.azure_ingress_private_link_endpoint] : []
    content {
      private_endpoint_resource_id = azure_ingress_private_link_endpoint.value.private_endpoint_resource_id
    }
  }

  dynamic "gcp_egress_private_service_connect_endpoint" {
    for_each = each.value.gcp_egress_private_service_connect_endpoint != null ? [each.value.gcp_egress_private_service_connect_endpoint] : []
    content {
      private_service_connect_endpoint_target = gcp_egress_private_service_connect_endpoint.value.private_service_connect_endpoint_target
    }
  }

  dynamic "gcp_ingress_private_service_connect_endpoint" {
    for_each = each.value.gcp_ingress_private_service_connect_endpoint != null ? [each.value.gcp_ingress_private_service_connect_endpoint] : []
    content {
      private_service_connect_connection_id = gcp_ingress_private_service_connect_endpoint.value.private_service_connect_connection_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

