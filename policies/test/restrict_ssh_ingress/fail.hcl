mock "tfplan/v2" {
  data = {
    resource_changes = {
      "aws_security_group.web" = {
        mode = "managed"
        type = "aws_security_group"
        change = {
          actions = ["create"]
          after = {
            ingress = [
              {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                ipv6_cidr_blocks = []
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
