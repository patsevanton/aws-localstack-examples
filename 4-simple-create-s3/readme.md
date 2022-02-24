## Create a new AWS S3 Bucket
```
awslocal s3 mb s3://test-s3-bucket
```

## Lists all AWS S3 Buckets
```
awslocal s3 ls
```

## Copy a single file from the local system to cloud-based AWS S3 Buckets
```
awslocal s3 cp test.txt s3://test-s3-bucket
```

## List all Files in an S3 Bucket
```
awslocal s3 ls s3://test-s3-bucket
```

## List all Files recursive human-readable summarize in an S3 Bucket
```
awslocal s3 ls s3://test-s3-bucket --recursive --human-readable --summarize
```

## List only the Filenames of an S3 Bucket
```
awslocal s3api list-objects --bucket test-s3-bucket --output text --query "Contents[].{Key: Key}"
```

## Delete the content of AWS S3 via CLI (S3 RB)
```
awslocal s3 rb s3://test-s3-bucket --force
```

## Run by terraform
```
terraform init
terraform apply -auto-approve
```


Links:
https://stackoverflow.com/questions/57151326/difference-between-the-apis-aws-s3-and-aws-s3api-when-granting-permissions-t
https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest
https://bobbyhadz.com/blog/aws-cli-list-all-files-in-bucket
https://linoxide.com/upload-files-to-s3-using-terraform/
https://stackoverflow.com/questions/56107258/terraform-upload-file-to-s3-on-every-apply
https://lepczynski.it/en/aws_en/5-ways-to-remove-aws-s3-bucket/
https://www.linkedin.com/pulse/complete-automated-infrastructure-build-up-aws-cloud-mahek-mulla
