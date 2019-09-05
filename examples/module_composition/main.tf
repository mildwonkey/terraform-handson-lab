module "webserver" {
  source = "./modules/webserver"
}

locals {
  fixed_recordsets = [
    {
      name = "www.example.com"
      type = "CNAME"
      ttl  = 3600
      records = [
        "webserver01",
        "webserver02",
        "webserver03",
      ]
    },
  ]
  server_recordsets = [
    for i, addr in module.webserver.public_ip_addrs : {
      name    = format("webserver%02d", i)
      type    = "A"
      records = [addr]
      ttl     = 600
    }
  ]
}

variable "route53_zone_id" {
  default = "987321567"
}

module "dns_records" {
  source = "./modules/route53-dns-records"

  route53_zone_id = var.route53_zone_id
  recordsets      = concat(local.fixed_recordsets, local.server_recordsets)
}

output "created_records" {
  value = module.dns_records.created_records
}
