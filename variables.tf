variable "access_points" {
  description = <<EOT
Map of access_points, attributes below
Required:
    - environment (block):
        - id (required)
    - gateway (block):
        - id (required)
Optional:
    - display_name
    - aws_egress_private_link_endpoint (block):
        - enable_high_availability (optional)
        - vpc_endpoint_service_name (required)
    - aws_ingress_private_link_endpoint (block):
        - vpc_endpoint_id (required)
    - aws_private_network_interface (block):
        - account (required)
        - network_interfaces (required)
        - routes (optional)
    - azure_egress_private_link_endpoint (block):
        - private_link_service_resource_id (required)
        - private_link_subresource_name (optional)
    - azure_ingress_private_link_endpoint (block):
        - private_endpoint_resource_id (required)
    - gcp_egress_private_service_connect_endpoint (block):
        - private_service_connect_endpoint_target (required)
    - gcp_ingress_private_service_connect_endpoint (block):
        - private_service_connect_connection_id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    display_name = optional(string)
    environment = object({
      id = string
    })
    gateway = object({
      id = string
    })
    aws_egress_private_link_endpoint = optional(object({
      enable_high_availability  = optional(bool)
      vpc_endpoint_service_name = string
    }))
    aws_ingress_private_link_endpoint = optional(object({
      vpc_endpoint_id = string
    }))
    aws_private_network_interface = optional(object({
      account            = string
      network_interfaces = set(string)
      routes             = optional(list(string))
    }))
    azure_egress_private_link_endpoint = optional(object({
      private_link_service_resource_id = string
      private_link_subresource_name    = optional(string)
    }))
    azure_ingress_private_link_endpoint = optional(object({
      private_endpoint_resource_id = string
    }))
    gcp_egress_private_service_connect_endpoint = optional(object({
      private_service_connect_endpoint_target = string
    }))
    gcp_ingress_private_service_connect_endpoint = optional(object({
      private_service_connect_connection_id = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

