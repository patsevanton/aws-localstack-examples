
## Create a new aws S3 Bucket
```
aws s3api create-bucket --bucket versioning-demo-bucket
```

## Enable Versioning S3 Bucket
```
aws s3api put-bucket-versioning --bucket versioning-demo-bucket --versioning-configuration MFADelete=Disabled,Status=Enabled
```

## Check versioning status of versioning-demo-bucket bucket
```
aws s3api get-bucket-versioning --bucket versioning-demo-bucket
```


Links:
https://cloudkatha.com/how-to-enable-versioning-in-s3-bucket-using-console-cli-and-cloudformation/
