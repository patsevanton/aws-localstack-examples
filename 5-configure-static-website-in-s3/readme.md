
## Create a new aws S3 Bucket
```
awslocal s3 mb s3://mypublicbucket
```

## Make an S3 Bucket Permissions Public Access to 'Everyone' using CLI
```
awslocal s3api put-bucket-acl --bucket mypublicbucket --acl public-read
```

## Synchronize between AWS S3 and Local Directory with Permissions Public Access
```
awslocal s3 sync . s3://mypublicbucket --acl public-read
```
Output:
```
upload: ./main.tf to s3://mypublicbucket/main.tf
upload: ./index.html to s3://mypublicbucket/index.html
upload: ./error.html to s3://mypublicbucket/error.html
upload: ./readme.md to s3://mypublicbucket/readme.md
upload: ./provider.tf to s3://mypublicbucket/provider.tf
```

## Enable the s3 bucket to host an index and error html page
```
awslocal s3 website s3://mypublicbucket/ --index-document index.html --error-document error.html
```

## Check IndexDocument and ErrorDocument
```
awslocal s3api get-bucket-website --bucket mypublicbucket
```
Output:
```json
{
    "IndexDocument": {
        "Suffix": "index.html"
    },
    "ErrorDocument": {
        "Key": "error.html"
    }
}
```

## Open in browser
```
http://mypublicbucket.s3-website.localhost.localstack.cloud:4566/
```

## Run by terraform
```
terraform init
terraform apply -auto-approve
```

Links:
https://medium.com/@dangaldeependra/synchronize-between-aws-s3-and-local-windows-drive-52483e33a9e6
https://github.com/localstack/localstack/issues/854
https://stackoverflow.com/questions/27899/is-there-a-way-to-have-index-html-functionality-with-content-hosted-on-s3
https://sammeechward.com/aws-cli-s3-static-website/
https://stackoverflow.com/questions/20264928/s3-static-website-index-document
https://medium.com/@kyle.galbraith/how-to-host-a-website-on-s3-without-getting-lost-in-the-sea-e2b82aa6cd38
https://acloudguru.com/hands-on-labs/setting-up-an-s3-static-website-using-aws-cli
