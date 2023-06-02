resource "aws_s3_bucket" "helloworld" {
  bucket = "tj-terraform-helloworld"

  tags = {
    app         = "HelloWorld"
    environment = "development"
    purpose     = "poc"
  }
}

resource "aws_iam_policy" "write_to_prefix" {
  name        = "write-to-prefix"
  path        = "/"
  description = "Allow access to the bucket on prefix can_be_written/"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowListBuckets",
        "Action" : ["s3:GetBucketLocation", "s3:ListAllMyBuckets"],
        "Effect" : "Allow",
        "Resource" : ["arn:aws:s3:::*"]
      },
      {
        "Sid" : "AllowListObjectsInBucket",
        "Action" : ["s3:ListBucket"],
        "Effect" : "Allow",
        "Resource" : [format("arn:aws:s3:::%s", aws_s3_bucket.helloworld.id)],
        "Condition" : { "StringEquals" : { "s3:prefix" : ["", "/can_be_written/"], "s3:delimiter" : ["/"] } }
      },
      {
        "Sid" : "AllowWriteToPrefix",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
        ],
        "Resource" : [
          format("arn:aws:s3:::%s/can_be_written/*", aws_s3_bucket.helloworld.id)
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "bucket_policy_to_iam_role" {
  role       = aws_iam_role.helloworld_poc_role.name
  policy_arn = aws_iam_policy.write_to_prefix.arn
}
