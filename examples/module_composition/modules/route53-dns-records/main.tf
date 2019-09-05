variable "route53_zone_id" {
  type = string
}

variable "recordsets" {
  type = list(object({
    name    = string
    ttl     = string
    records = list(string)
    type    = string
  }))
}

locals {
  created_records = [
    for i, record in var.recordsets : {
      name  = record.name
      value = record.records
    }
  ]
}

output "created_records" {
  value = local.created_records
}
