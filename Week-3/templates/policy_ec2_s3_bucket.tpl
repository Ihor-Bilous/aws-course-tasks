{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": ["s3:ListBucket"],
            "Resource": ["arn:aws:s3:::${bucket_name}"]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": ["arn:aws:s3:::${bucket_name}/*"]
        }
    ]
}
