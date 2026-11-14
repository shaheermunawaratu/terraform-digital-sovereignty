mock "tfplan/v2" {
  data = {
    resource_changes = {
      "aws_instance.non_compliant" = {
        mode = "managed"
        type = "aws_instance"
        change = {
          actions = ["create"]
          after = {
            metadata_options = [
              {
                http_tokens = "optional"
              }
            ]
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
