resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo" {
  bucket        = "swapnil-s3-endpoint-demo-${random_id.bucket_id.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.demo.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
