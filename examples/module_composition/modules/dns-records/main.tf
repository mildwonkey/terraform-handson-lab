variable "zone_id" {
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
    for i, record in var.recordsets :
    record.name
  ]
}

output "created_records" {
  value = local.created_records
}
