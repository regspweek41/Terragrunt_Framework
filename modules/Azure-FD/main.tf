

resource "azurerm_frontdoor" "example" {
  name                = var.Front_door
  resource_group_name = var.Resource_Group



dynamic "backend_pool_load_balancing" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name                            = "loadBalancingSettings-${lookup(host.value, "name")}"
      sample_size                     = 4
      successful_samples_required     = 2
      additional_latency_milliseconds = 0
    }
  }

  dynamic "backend_pool_health_probe" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name                = "healthProbeSettings-${lookup(host.value, "name")}"
      interval_in_seconds = 30
      path                = "/"
      protocol            = "Https"
    }
  }

  dynamic "backend_pool" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name = "${lookup(host.value, "name")}"
      dynamic "backend" {
        iterator = domain
        for_each = var.backend_domain
        content {
          host_header = "${lookup(host.value, "name")}.${var.env}.${domain.value}"
          address     = "${lookup(host.value, "name")}.${var.env}.${domain.value}"
          http_port   = 80
          https_port  = 443
          priority    = 1
          
          weight      = 50
        }
      }

      load_balancing_name = "loadBalancingSettings-${lookup(host.value, "name")}"
      health_probe_name   = "healthProbeSettings-${lookup(host.value, "name")}"
    }
  }

dynamic "frontend_endpoint" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name                                    = "${lookup(host.value, "name")}"
      host_name                               = "${var.Front_door}.azurefd.net"

    }
  }

dynamic "routing_rule" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name               = "${lookup(host.value, "name")}Rule"
      accepted_protocols = ["Http", "Https"]
      patterns_to_match  = ["/*"]
      frontend_endpoints = ["${lookup(host.value, "name")}"]

      forwarding_configuration {
        forwarding_protocol                   = "MatchRequest"
        backend_pool_name                     = "${lookup(host.value, "name")}"
       
        
        custom_forwarding_path                = ""
      }
    }
  }

}


