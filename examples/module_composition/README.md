# Module Composition

Refactor the configuration in main.tf so that you can swap out the module
"source" for any of the example modules in "./modules" without changing the
module block.

Terraforms's [Module Composition](https://www.terraform.io/docs/modules/composition.html#multi-cloud-abstractions) documentation will be helpful in this exercise.

To avoid the need for API keys (and creating actual resources which cost money),
the modules are all mocks which require the same inputs, and output the same
values, that one might expect from actual modules for creating DNS records. 