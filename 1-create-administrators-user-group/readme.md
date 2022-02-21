## Create an administrators user group
```
awslocal iam create-group --group-name AWSAdminsGroup
```
Output:
```json
{
    "Group": {
        "Path": "/",
        "GroupName": "AWSAdminsGroup",
        "GroupId": "bkk8m01rp7mfr6e8rdaq",
        "Arn": "arn:aws:iam::000000000000:group/AWSAdminsGroup",
        "CreateDate": "2022-02-21T09:28:14.971Z"
    }
}
```
## List the user groups in your AWS account 
```
awslocal iam list-groups
```
Output:
```json
{
    "Groups": [
        {
            "Path": "/",
            "GroupName": "AWSAdminsGroup",
            "GroupId": "bkk8m01rp7mfr6e8rdaq",
            "Arn": "arn:aws:iam::000000000000:group/AWSAdminsGroup"
        }
    ]
}
```

## Attach the policy called AdministratorAccess to your AWSAdminsGroup user group
```
awslocal iam attach-group-policy --group-name AWSAdminsGroup --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
```
Output emptry.

## Confirm the policy is attached to the AWSAdminsGroup user group
```
awslocal iam list-attached-group-policies --group-name AWSAdminsGroup
```
Output:
```json
{
    "AttachedPolicies": [
        {
            "PolicyName": "AdministratorAccess",
            "PolicyArn": "arn:aws:iam::aws:policy/AdministratorAccess"
        }
    ]
}
```

## Create the user
```
aws iam create-user --user-name MyUser
```
Output:
```json
{
    "User": {
        "UserName": "MyUser",
        "Path": "/",
        "CreateDate": "2018-12-14T03:13:02.581Z",
        "UserId": "AIDAJY2PE5XUZ4EXAMPLE",
        "Arn": "arn:aws:iam::123456789012:user/MyUser"
    }
}
```

## Add the user to the group
```
aws iam add-user-to-group --user-name MyUser --group-name AWSAdminsGroup
```

## Verify that the AWSAdminsGroup group contains the MyUser
```
aws iam get-group --group-name AWSAdminsGroup
```
Output:
```json
{
    "Group": {
        "GroupName": "MyIamGroup",
        "CreateDate": "2018-12-14T03:03:52Z",
        "GroupId": "AGPAJNUJ2W4IJVEXAMPLE",
        "Arn": "arn:aws:iam::123456789012:group/MyIamGroup",
        "Path": "/"
    },
    "Users": [
        {
            "UserName": "MyUser",
            "Path": "/",
            "CreateDate": "2018-12-14T03:13:02Z",
            "UserId": "AIDAJY2PE5XUZ4EXAMPLE",
            "Arn": "arn:aws:iam::123456789012:user/MyUser"
        }
    ],
    "IsTruncated": "false"
}
```

## Run by terraform
```
terraform init
terraform apply  -auto-approve
```

https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html
