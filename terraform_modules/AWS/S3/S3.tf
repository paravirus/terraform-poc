module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }

  # NIST Compliance Settings
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    enabled = true
    prefix  = ""
    expiration {
      days = 30
    }
  }

  # Additional NIST Compliance Settings
  tags = {
    Environment = "Production"
    Compliance  = "NIST"
  }
}
