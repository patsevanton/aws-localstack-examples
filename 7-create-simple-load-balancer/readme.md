
## Displays the details of your subnets
```
awslocal ec2 describe-subnets
```

## List subnetID
```
awslocal ec2 describe-subnets  --query "Subnets[*].SubnetId" --output text
```

## Create the classic load balancer
```
awslocal elbv2 create-load-balancer --name my-load-balancer --subnets subnet-de3dbdc6
```


Links:
https://awsclibuilder.com/home/services/elbv2
https://docs.datadoghq.com/security_platform/default_rules/aws-elbv2-internet/
https://traefik.io/blog/traefik-proxy-and-http-3-on-aws-eks/

