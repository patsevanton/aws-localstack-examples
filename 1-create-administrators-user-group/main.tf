provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_force_path_style         = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    iam            = "http://localhost:4566"
  }
}


resource "aws_iam_group" "aws_Admins_group" {
  name = "AWSAdminsGroup"
  path = "/"
}

resource "aws_iam_group_policy_attachment" "aws_group_Admins_attach" {
  group      = "${aws_iam_group.aws_Admins_group}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
