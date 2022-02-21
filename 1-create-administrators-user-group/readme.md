awslocal iam create-group --group-name Admins
{
    "Group": {
        "Path": "/", 
        "CreateDate": "2014-06-05T20:29:53.622Z", 
        "GroupId":"ABCDEFGHABCDEFGHABCDE",
        "Arn": "arn:aws:iam::123456789012:group/Admins", 
        "GroupName": "Admins"
    }
}

awslocal iam list-groups
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

awslocal iam attach-group-policy --group-name Admins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

{
    "AttachedPolicies": [
        {
            "PolicyName": "AdministratorAccess",
            "PolicyArn": "arn:aws:iam::aws:policy/AdministratorAccess"
        }
    ],
    "IsTruncated": false
}