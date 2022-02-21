resource "aws_iam_group" "aws_Admins_group" {
  name = "AWSAdminsGroup"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "aws_group_Admins_attach" {
  group      = aws_iam_group.aws_Admins_group.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
