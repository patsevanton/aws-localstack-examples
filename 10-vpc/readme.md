## Displays the details of your subnets
```
awslocal ec2 describe-subnets
```

## List subnetID
```
awslocal ec2 describe-subnets  --query 'Subnets[*].{SubnetId:SubnetId,AvailabilityZone:AvailabilityZone,CidrBlock:CidrBlock}'
```

Create VPC:
```
awslocal ec2 create-vpc --cidr-block 10.0.0.0/16
```


Links:
https://github.com/ravsau/AWS-CLI-Commands/blob/master/vpc/create-a-vpc-with-subnets-RT-GATEWAYS-etc.MD
https://stackoverflow.com/questions/62724716/capturing-a-value-in-a-select-and-using-it-in-an-object-at-the-top-level-with-jq
https://brad-simonin.medium.com/create-an-aws-vpc-and-subnet-using-the-aws-cli-and-bash-a92af4d2e54b
https://blog.ashiny.cloud/page/awscli-query-quickref/
https://sammeechward.com/aws-cli-vpc-subnets-ec2-and-more/


