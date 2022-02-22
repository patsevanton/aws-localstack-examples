## Describe an AMI images
```
awslocal ec2 describe-images
```

## Describe an AMI images (ImageId and Name)
## https://opensourceconnections.com/blog/2015/07/27/advanced-aws-cli-jmespath-query/
```
awslocal ec2 describe-images --owner amazon --query 'Images[].[ImageId,Name]' --output text
```

## Launch an instance into a default subnet
```
awslocal ec2 run-instances --image-id ami-000c540e28953ace2 --instance-type t2.micro --key-name MyKeyPair
```

## Run by terraform
```
terraform init
terraform apply  -auto-approve
```

https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html
