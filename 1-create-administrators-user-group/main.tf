resource "aws_iam_group" "aws_Admins_group" {
  name = "AWSAdminsGroup"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "aws_group_Admins_attach" {
  group      = aws_iam_group.aws_Admins_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "MyUser" {
  name = "MyUser"
  path = "/"
}

resource "aws_iam_user_group_membership" "MyUser_to_aws_Admins_group" {
  user = aws_iam_user.MyUser.name

  groups = [
    aws_iam_group.aws_Admins_group.name
  ]
}
