
## List of Amazon regions
```
awslocal ec2 describe-regions --output text
```

## List of Amazon availability zones
```
awslocal ec2 describe-availability-zones
```

## Get default region
```
awslocal ec2 describe-availability-zones --output text --query 'AvailabilityZones[0].[RegionName]'
```
Output:
```
us-east-1
```

## List availability ZoneId in default region
```
awslocal ec2 describe-availability-zones --query 'AvailabilityZones[].ZoneId'
```
Output:
```json
[
    "use1-az6",
    "use1-az1",
    "use1-az2",
    "use1-az4",
    "use1-az3",
    "use1-az5"
]
```

Links:
https://cloudcasts.io/article/aws-cli-tricks

