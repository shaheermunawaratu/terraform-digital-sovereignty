mock "tfconfig/v2" {
  data = {
    providers = {
      "aws" = {
        name = "aws"
        config = {
          region = {
            references = ["var.aws_region"]
          }
        }
      }
    }
  }
}

mock "tfplan/v2" {
  data = {
    variables = {
      aws_region = {
        value = "us-east-1"
      }
    }
  }
}

test {
  rules = {
    main = false
  }
}
