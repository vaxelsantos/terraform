resource "aws_s3_bucket" "bucket_tf_state" {
  bucket = "bucket-tf-state-grupo32"
}

resource "aws_s3_bucket_versioning" "bucket-tf-state-grupo32_versioning" {
  bucket = aws_s3_bucket.bucket_tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
