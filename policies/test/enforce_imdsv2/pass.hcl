mock "tfplan/v2" {
  data = {
    resource_changes = {
      "aws_instance.compliant" = {
        mode = "managed"
        type = "aws_instance"
        change = {
          actions = ["create"]
          after = {
            metadata_options = [
              {
                http_tokens = "required"
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
    main = true
  }
}
