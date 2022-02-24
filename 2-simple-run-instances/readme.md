## Install jq
```
sudo apt update
sudo apt install jq -y
```

## Describe an AMI images
```
awslocal ec2 describe-images
```

## Describe an AMI images (ImageId and Name)

```
awslocal ec2 describe-images --owner amazon --query 'Images[].[ImageId,Name]' --output text
```

## Get a list of instance types from aws cli
```
awslocal ec2 describe-instance-types --filters Name=current-generation,Values=true | jq -c '.InstanceTypes | reduce .[] as $i ({}; .[$i.InstanceType] = { memory_in_mib: $i.MemoryInfo.SizeInMiB, vcpus: $i.VCpuInfo.DefaultVCpus, disk_in_gb: $i.InstanceStorageInfo.TotalSizeInGB})' | jq
```

## Display your key pair
```
awslocal ec2 describe-key-pairs
```
Output:
```json
{
    "KeyPairs": []
}
```

## Create a New Key Pair for EC2 Instances
```
awslocal ec2 create-key-pair --key-name AntonLocalStackKeyPair --output text > AntonLocalStackKeyPair.pem
```
View AntonLocalStackKeyPair.pem
```
cat AntonLocalStackKeyPair.pem
1a:cd:b9:c1:b9:03:ab:59:8b:72:ee:a3:ca:1b:70:81 -----BEGIN RSA PRIVATE KEY-----
...
-----END RSA PRIVATE KEY-----
        AntonLocalStackKeyPair
```

## Launch an instance into a default subnet
```
awslocal ec2 run-instances --image-id ami-000c540e28953ace2 --instance-type t2.micro --key-name AntonLocalStackKeyPair
```
Output:
```json
{
    "Groups": [
        {
            "GroupName": "default",
            "GroupId": "sg-245f6a01"
        }
    ],
    "Instances": [
        {
            "AmiLaunchIndex": 0,
            "ImageId": "ami-000c540e28953ace2",
            "InstanceId": "i-8829ff49f6ef8c536",
            "InstanceType": "t2.micro",
            "KernelId": "None",
            "KeyName": "AntonLocalStackKeyPair",
            "LaunchTime": "2022-02-23T05:25:53.000Z",
            "Monitoring": {
                "State": "enabled"
            },
            "Placement": {
                "AvailabilityZone": "us-east-1a",
                "GroupName": "",
                "Tenancy": "default"
            },
            "Platform": "Linux/UNIX",
            "PrivateDnsName": "ip-10-183-4-53.ec2.internal",
            "PrivateIpAddress": "10.183.4.53",
            "PublicDnsName": "ec2-54-214-85-231.compute-1.amazonaws.com",
            "PublicIpAddress": "54.214.85.231",
            "State": {
                "Code": 0,
                "Name": "pending"
            },
            "StateTransitionReason": "",
            "SubnetId": "subnet-fa7f837b",
            "VpcId": "vpc-bcee8c5b",
            "Architecture": "x86_64",
            "ClientToken": "",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "NetworkInterfaces": [
                {
                    "Association": {
                        "IpOwnerId": "000000000000",
                        "PublicIp": "54.214.85.231"
                    },
                    "Attachment": {
                        "AttachTime": "2015-01-01T00:00:00Z",
                        "AttachmentId": "eni-attach-abc50794",
                        "DeleteOnTermination": true,
                        "DeviceIndex": 0,
                        "Status": "attached"
                    },
                    "Description": "Primary network interface",
                    "Groups": [
                        {
                            "GroupName": "default",
                            "GroupId": "sg-d5b2826eb1f1a9ff4"
                        }
                    ],
                    "MacAddress": "1b:2b:3c:4d:5e:6f",
                    "NetworkInterfaceId": "eni-14b5babf",
                    "OwnerId": "000000000000",
                    "PrivateIpAddress": "10.183.4.53",
                    "PrivateIpAddresses": [
                        {
                            "Association": {
                                "IpOwnerId": "000000000000",
                                "PublicIp": "54.214.85.231"
                            },
                            "Primary": true,
                            "PrivateIpAddress": "10.183.4.53"
                        }
                    ],
                    "SourceDestCheck": true,
                    "Status": "in-use",
                    "SubnetId": "subnet-fa7f837b",
                    "VpcId": "vpc-bcee8c5b"
                }
            ],
            "SecurityGroups": [],
            "SourceDestCheck": true,
            "Tags": [],
            "VirtualizationType": "hvm"
        }
    ],
    "OwnerId": "000000000000",
    "ReservationId": "r-a09dc268"
}
```

## Get ec2 instance at CLI
```
awslocal ec2 describe-instances
```

## Get ec2 instance state at CLI
```
awslocal ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, ImageId, State.code, State.Name]" --o text
```

## Find out the used Key pair name via AWS CLI
```
awslocal ec2 describe-instances --instance-ids i-6646d5bff71544a90 | jq '.Reservations[].Instances[].KeyName'
```
Output:
```
"AntonLocalStackKeyPair"
```

## Run by terraform
```
terraform init
terraform apply  -auto-approve
```


Links:
https://github.com/aws/aws-cli/issues/1279
https://opensourceconnections.com/blog/2015/07/27/advanced-aws-cli-jmespath-query/
https://bootstrap-it.com/awscli/
https://fossies.org/linux/aws-cli/awscli/examples/ec2/run-instances.rst
https://www.baeldung.com/linux/aws-cli-ec2
https://docs.outscale.com/en/userguide/Launching-Instances-Using-AWS-CLI.html
https://stackoverflow.com/questions/49743220/how-do-i-create-an-ssh-key-in-terraform
https://artem.services/?p=1411