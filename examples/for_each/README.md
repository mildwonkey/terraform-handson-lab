# Resource for_each

Refactor the configuration in main.tf to use the ["for_each"](https://www.terraform.io/docs/configuration/resources.html#for_each-multiple-resource-instances-defined-by-a-map-or-set-of-strings) construct to create multiple docker containers in a single `resource` block.


**NOTE** If it isn't already obvious, this example does not create anything _useful_, just a handful of containers pretending to be a cluster.
