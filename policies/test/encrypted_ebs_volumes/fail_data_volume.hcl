mock "tfplan/v2" {
  data = {
    resource_changes = {
      "aws_instance.compliant" = {
        mode = "managed"
        type = "aws_instance"
        change = {
          actions = ["create"]
          after = {
            root_block_device = [
              {
                encrypted = true
              }
            ]
          }
        }
      }
      "aws_ebs_volume.non_compliant" = {
        mode = "managed"
        type = "aws_ebs_volume"
        change = {
          actions = ["create"]
          after = {
            encrypted = false
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
