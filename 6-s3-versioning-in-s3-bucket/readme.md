
## Create a new aws S3 Bucket
```
awslocal s3api create-bucket --bucket versioning-demo-bucket
```

## Enable Versioning S3 Bucket
```
awawslocals s3api put-bucket-versioning --bucket versioning-demo-bucket --versioning-configuration MFADelete=Disabled,Status=Enabled
```

## Check versioning status of versioning-demo-bucket bucket
```
awslocal s3api get-bucket-versioning --bucket versioning-demo-bucket
```

## Run by terraform
```
terraform init
terraform apply -auto-approve
```

Links:
https://cloudkatha.com/how-to-enable-versioning-in-s3-bucket-using-console-cli-and-cloudformation/
https://www.koding.com/docs/terraform/providers/aws/r/s3_bucket.html/

