# resource "aws_s3_bucket" "bucket1" {
#     # count = 3 //harcoded(cause errors)
#     count = length(var.bucket_names)
#     bucket = var.bucket_names[count.index]

#     tags = var.tags
  
# }

resource "aws_s3_bucket" "bucket2" {
    for_each = var.bucket_name_set
    bucket = each.value //can use each.key too 
    tags = var.tags
}