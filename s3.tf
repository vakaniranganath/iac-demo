resource "aws_s3_bucket" "b" {
  bucket = "ranganath609"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
resource "aws_s3_bucket_object" "object" {
for_each = fileset("myfiles/", "*")
bucket = aws_s3_bucket.b.id
key = each.value
source = "myfiles/${each.value}"
etag = filemd5("myfiles/${each.value}")
}
