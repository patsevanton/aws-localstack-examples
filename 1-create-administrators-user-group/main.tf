## Create an administrators user group
resource "aws_iam_group" "aws_Admins_group" {
  name = "AWSAdminsGroup"
  path = "/"
}

## Attach the policy called AdministratorAccess to your AWSAdminsGroup user group
resource "aws_iam_group_policy_attachment" "aws_group_Admins_attach" {
  group      = aws_iam_group.aws_Admins_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

## Create the iam user
resource "aws_iam_user" "MyUser" {
  name = "MyUser"
  path = "/"
}

## Add the user to the group
resource "aws_iam_user_group_membership" "MyUser_to_aws_Admins_group" {
  user = aws_iam_user.MyUser.name

  groups = [
    aws_iam_group.aws_Admins_group.name
  ]
}
