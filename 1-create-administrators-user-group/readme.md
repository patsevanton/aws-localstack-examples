Create an administrators user group
```
awslocal iam create-group --group-name Admins
```
Output:
```json
{
    "Group": {
        "Path": "/", 
        "CreateDate": "2014-06-05T20:29:53.622Z", 
        "GroupId":"ABCDEFGHABCDEFGHABCDE",
        "Arn": "arn:aws:iam::123456789012:group/Admins", 
        "GroupName": "Admins"
    }
}
```
List the user groups in your AWS account 
```
awslocal iam list-groups
```
Output:
```json
{
    "Groups": [
        {
            "Path": "/", 
            "CreateDate": "2014-06-05T20:29:53.622Z", 
            "GroupId":"ABCDEFGHABCDEFGHABCDE", 
            "Arn": "arn:aws:iam::123456789012:group/Admins", 
            "GroupName": "Admins"
        }
    ]
}
```
Attach the policy called AdministratorAccess to your Admins user group
```
awslocal iam attach-group-policy --group-name Admins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```
Output:
```json
{
    "AttachedPolicies": [
        {
            "PolicyName": "AdministratorAccess",
            "PolicyArn": "arn:aws:iam::aws:policy/AdministratorAccess"
        }
    ],
    "IsTruncated": false
}
```

Confirm the policy is attached to the Admins user group
```
awslocal iam list-attached-group-policies --group-name Admins
```
Output:
```
{
    "AttachedPolicies": [
        {
            "PolicyName": "AdministratorAccess",
            "PolicyArn": "arn:aws:iam::aws:policy/AdministratorAccess"
        }
    ],
    "IsTruncated": false
}
```

Run by terraform
```
terraform init
terraform apply  -auto-approve
```

https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html
