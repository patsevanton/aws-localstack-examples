## Create a security group for EC2SecurityGroup
```
awslocal ec2 create-security-group --group-name EC2SecurityGroup --description "Security Group for EC2 instances to allow ports 22"
```
Output:
```json
{
    "GroupId": "sg-601f4f750f4338cf6",
    "Tags": []
}
```

## Create Rules For Security Group
```
awslocal ec2 authorize-security-group-ingress --group-name EC2SecurityGroup --protocol tcp --port 22 --cidr 172.54.125.8/32
```
Output:
```json
{
    "Return": true,
    "SecurityGroupRules": [
        {
            "SecurityGroupRuleId": "sgr-371fcf0158fb0a51e",
            "GroupId": "sg-601f4f750f4338cf6",
            "GroupOwnerId": "000000000000",
            "IsEgress": false,
            "IpProtocol": "tcp",
            "FromPort": 22,
            "ToPort": 22,
            "CidrIpv4": "172.54.125.8/32",
            "Description": ""
        }
    ]
}
```

## Check and validate if rules got attached to our security group.
```
awslocal ec2 describe-security-groups --group-names EC2SecurityGroup
```
Output:
```json
{
    "SecurityGroups": [
        {
            "Description": "Security Group for EC2 instances to allow ports 22",
            "GroupName": "EC2SecurityGroup",
            "IpPermissions": [
                {
                    "FromPort": 22,
                    "IpProtocol": "tcp",
                    "IpRanges": [
                        {
                            "CidrIp": "172.54.125.8/32"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "ToPort": 22,
                    "UserIdGroupPairs": []
                }
            ],
            "OwnerId": "000000000000",
            "GroupId": "sg-601f4f750f4338cf6",
            "IpPermissionsEgress": [
                {
                    "IpProtocol": "-1",
                    "IpRanges": [
                        {
                            "CidrIp": "0.0.0.0/0"
                        }
                    ],
                    "Ipv6Ranges": [],
                    "PrefixListIds": [],
                    "UserIdGroupPairs": []
                }
            ],
            "Tags": [],
            "VpcId": "vpc-97d7adf8"
        }
    ]
}
```

## Run by terraform
```
terraform init
terraform apply -auto-approve
```


Links:
https://github.com/aws/aws-cli/blob/develop/awscli/examples/ec2/create-security-group.rst
https://dev.to/mariehposa/how-to-create-vpc-subnets-route-tables-security-groups-and-instances-using-aws-cli-14a4#security-group
https://bootstrap-it.com/awscli/
https://www.linkedin.com/pulse/create-high-availability-architecture-aws-cli-sunil-sirvi
https://github.com/terraform-aws-modules/terraform-aws-security-group
https://medium.com/teckdevops/aws-ec2-cli-8b9bf1478d97
https://fossies.org/linux/aws-cli/awscli/examples/ec2/authorize-security-group-ingress.rst