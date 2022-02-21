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
Output empty.

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
awslocal iam create-user --user-name MyUser
```
Output:
```json
{
    "User": {
        "Path": "/",
        "UserName": "MyUser",
        "UserId": "gj4yfvcjmhqw3715kau7",
        "Arn": "arn:aws:iam::000000000000:user/MyUser",
        "CreateDate": "2022-02-21T09:55:01.093Z"
    }
}
```

## Add the user to the group
```
awslocal iam add-user-to-group --user-name MyUser --group-name AWSAdminsGroup
```
Output empty.

## Verify that the AWSAdminsGroup group contains the MyUser
```
awslocal iam get-group --group-name AWSAdminsGroup
```
Output:
```json
{
    "Users": [
        {
            "Path": "/",
            "UserName": "MyUser",
            "UserId": "gj4yfvcjmhqw3715kau7",
            "Arn": "arn:aws:iam::000000000000:user/MyUser"
        }
    ],
    "Group": {
        "Path": "/",
        "GroupName": "AWSAdminsGroup",
        "GroupId": "7w1t3fmldzmlbzssou5x",
        "Arn": "arn:aws:iam::000000000000:group/AWSAdminsGroup",
        "CreateDate": "2022-02-21T09:53:32.256Z"
    }
}
```

## Run by terraform
```
terraform init
terraform apply  -auto-approve
```

https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html
