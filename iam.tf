resource "aws_iam_role" "our-iam-role" {
    name = "Terraform-Admin"
    assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
})
  
}

resource "aws_iam_instance_profile" "our-instance-profile" {
    name = "jenkins-instance-profile"
    role = aws_iam_role.our-iam-role.name
  
}
/*
resource "aws_iam_policy" "my-iam-policy" {
    name = "my-iam-policy"
    policy = 
    path = "/role.json"
   # role = "${aws_iam_role.our-iam-role.name}"
}
*/