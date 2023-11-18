# main.tf

provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

# Create an S3 bucket for the static website
resource "aws_s3_bucket" "website" {
  bucket = "your-unique-bucket-name"  # Change this to a unique S3 bucket name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

# Create an IAM user and access keys for programmatic access
resource "aws_iam_user" "deploy_user" {
  name = "deploy-user"
}

resource "aws_iam_access_key" "deploy_user_access_key" {
  user = aws_iam_user.deploy_user.name
}

# Attach AmazonS3FullAccess policy to the IAM user
resource "aws_iam_user_policy_attachment" "deploy_user_policy" {
  user       = aws_iam_user.deploy_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

# Create CloudFront distribution for the S3 bucket
resource "aws_cloudfront_distribution" "website_distribution" {
  origin {
    domain_name = aws_s3_bucket.website.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.website.bucket_regional_domain_name
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Website CloudFront Distribution"
  default_root_object = "index.html"

  # Add additional CloudFront configuration as needed

  default_cache_behavior {
    target_origin_id = aws_s3_bucket.website.bucket_regional_domain_name

    viewer_protocol_policy = "allow-all"
    allowed_methods       = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
      cookies      = { forward = "none" }
    }
  }

  # Restrict access to CloudFront only
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # SSL/TLS configuration
  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

# Output the CloudFront distribution URL
output "cloudfront_url" {
  value = aws_cloudfront_distribution.website_distribution.domain_name
}
