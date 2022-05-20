resource "aws_s3_bucket_object" "object" {
for_each = fileset("myfiles/", "*")
bucket = aws_s3_bucket.b.id
key = each.value
source = "myfiles/${each.value}"
etag = filemd5("myfiles/${each.value}")
}
