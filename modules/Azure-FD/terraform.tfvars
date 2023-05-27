frontend_with_disabled_waf_rules = [
  {
    name = "demo1"
    rules = {
      PHP  = ["933160"],
      LFI  = ["930130"],
     }
  }
]

backend_domain = [
  "uksouth.example.com",
]
custom_domain_name = "example.com"