resource "aws_s3_bucket" "devops_rtt" {
  bucket        = "devops-rtt-test-bucket-4646"
  force_destroy = true

  tags = {
    Name        = "My_bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "devops_rtt2" {
  bucket        = "devops-rtt-test-bu-46584"
  force_destroy = true

  tags = {
    Name        = "My_bucket"
    Environment = "dev"
  }
}
