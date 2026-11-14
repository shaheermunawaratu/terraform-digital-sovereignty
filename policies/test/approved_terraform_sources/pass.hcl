mock "tfconfig/v2" {
  data = {
    providers = {
      "aws" = {
        name = "aws"
        full_name = "registry.terraform.io/hashicorp/aws"
        version_constraint = "~> 5.0"
      }
    }
  }
}

test {
  rules = {
    main = true
  }
}
