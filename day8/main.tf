resource "aws_s3_bucket" "bucket1" {
    count = 3
    bucket = var.bucket_names[count.index]

    tags = var.tags
  
}