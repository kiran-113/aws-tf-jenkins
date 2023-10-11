resource "aws_s3_bucket" "devops_rtt" {
  count         = 1
  bucket        = "devops-rtt-test-bucket-${count.index}"
  force_destroy = true

  tags = {
    Name        = "My_bucket"
    Environment = "dev"
  }
}
