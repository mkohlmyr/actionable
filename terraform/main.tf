provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_user" "user" {
  name = "github"
}

resource "aws_iam_policy" "policy" {
  name        = "github-policy"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                  "iam:CreatePolicy",
                  "iam:GetUserPolicy",
                  "iam:UpdateUser",
                  "iam:PutUserPolicy",
                  "iam:DeleteUserPolicy",
                  "iam:AttachUserPolicy",
                  "iam:DeletePolicy",
                  "iam:GetUser",
                  "iam:DetachUserPolicy"
                ],
                "Resource": [
                    "arn:aws:iam::278755489513:user/*",
                    "arn:aws:iam::278755489513:policy/*"
                ]
            }
        ]
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.policy.arn
}
