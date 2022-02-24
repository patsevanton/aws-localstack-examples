# Create a bucket
resource "aws_s3_bucket" "bucket1" {
  bucket = "tests3bucket"
}

# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucket1.id
  key    = "test.txt"
  source = "test.txt"
}
