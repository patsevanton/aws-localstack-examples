resource "aws_s3_bucket" "versioning-demo-bucket" { 
   bucket = "versioning-demo-bucket"
   acl = "private"
   versioning { 
      enabled = true
   }
}
