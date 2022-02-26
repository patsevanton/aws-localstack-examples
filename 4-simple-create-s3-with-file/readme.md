## Create a new AWS S3 Bucket
```
awslocal s3 mb s3://tests3bucket
```

## Lists all AWS S3 Buckets
```
awslocal s3 ls
```

## Copy a single file from the local system to cloud-based AWS S3 Buckets
```
awslocal s3 cp test.txt s3://tests3bucket
```

## List all Files in an S3 Bucket
```
awslocal s3 ls s3://tests3bucket
```

## List all Files recursive human-readable summarize in an S3 Bucket
```
awslocal s3 ls s3://tests3bucket --recursive --human-readable --summarize
```

## List only the Filenames of an S3 Bucket
```
awslocal s3api list-objects --bucket tests3bucket --output text --query "Contents[].{Key: Key}"
```

## Delete the content of AWS S3 via CLI (S3 RB)
```
awslocal s3 rb s3://tests3bucket --force
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
https://gcorelabs.com/ru/support/articles/360002115857/
https://stackoverflow.com/questions/2547046/make-a-bucket-public-in-amazon-s3
https://bobbyhadz.com/blog/aws-s3-allow-public-read-access
https://www.devroom.io/2010/12/24/public-readable-amazon-s3-bucket-policy/
https://stackoverflow.com/questions/19176926/how-to-make-all-objects-in-aws-s3-bucket-public-by-default
https://stackoverflow.com/questions/63271357/aws-s3-make-bucket-public
https://stackoverflow.com/questions/53346275/amazon-s3-bucket-policy-public-access-denied
https://stackoverflow.com/questions/60348163/how-do-you-allow-granting-public-read-access-to-objects-uploaded-to-aws-s3
https://stackoverflow.com/questions/27912462/how-do-i-make-all-files-in-an-s3-bucket-public
https://auth0.com/blog/fantastic-public-s3-buckets-and-how-to-find-them/
https://www.trendmicro.com/cloudoneconformity/knowledge-base/aws/S3/s3-bucket-public-read-access.html
https://www.thegeekstuff.com/2019/04/aws-s3-cli-examples/
https://devopslearning.medium.com/aws-s3-on-the-command-line-768658b33ec5
https://www.chaossearch.io/blog/how-to-create-an-s3-bucket-with-aws-cli
