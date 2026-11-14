mock "tfplan/v2" {
  data = {
    resource_changes = {
      "aws_instance.compliant" = {
        mode = "managed"
        type = "aws_instance"
        change = {
          actions = ["create"]
          after = {
            instance_type = "m5.large"
          }
        }
      }
    }
  }
}

test {
  rules = {
    main = false
  }
}
