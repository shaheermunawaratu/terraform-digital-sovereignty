mock "tfconfig/v2" {
  data = {
    providers = {
      "random" = {
        name = "random"
        full_name = "registry.terraform.io/hashicorp/random"
        version_constraint = "~> 3.0"
      }
    }
  }
}

test {
  rules = {
    main = false
  }
}
