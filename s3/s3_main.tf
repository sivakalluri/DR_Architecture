resource "aws_s3_bucket" "source_bucket" {
  bucket   = local.source_bucket_name
}

resource "aws_s3_bucket_acl" "source_bucket_acl" {
  bucket = aws_s3_bucket.source_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "source_versioning" {
  bucket = aws_s3_bucket.source_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "source_lc" {
  bucket = aws_s3_bucket.source_bucket.id
  depends_on = [aws_s3_bucket_versioning.source_versioning]
  rule {
    id      = "transition"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "INTELLIGENT_TIERING"
    }
    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 180
}
    noncurrent_version_expiration {
      noncurrent_days = 90

    }
  }
}

resource "aws_s3_bucket_replication_configuration" "source_replication" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.destination_versioning]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.source_bucket.id

  rule {
    id = "${var.business_divsion}-${var.environment}"

    filter {
      prefix = var.environment
    }

    status = "Enabled"

    delete_marker_replication {
      status = "Enabled"
      }

    destination {
      bucket        = aws_s3_bucket.destination_bucket.arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_s3_bucket" "destination_bucket" {
  bucket = local.destination_bucket_name
  provider = aws.region2
}

resource "aws_s3_bucket_versioning" "destination_versioning" {
  provider = aws.region2
  bucket = aws_s3_bucket.destination_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "dest_bucket_acl" {
  provider = aws.region2
  bucket = aws_s3_bucket.destination_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_lifecycle_configuration" "destination_lc" {
  provider = aws.region2
  bucket = aws_s3_bucket.destination_bucket.id
  depends_on = [aws_s3_bucket_versioning.destination_versioning]
  rule {
    id      = "transition"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "INTELLIGENT_TIERING"
    }
    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 180
}
    noncurrent_version_expiration {
      noncurrent_days = 90
    }

  }
}

resource "aws_s3_bucket_replication_configuration" "dest_replication" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.source_versioning]
  provider = aws.region2
  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.destination_bucket.id
  rule {
    id = "${var.business_divsion}-${var.environment}"

    filter {
      prefix = var.environment
    }

    status = "Enabled"

    delete_marker_replication {
      status = "Enabled"
      }

    destination {
      bucket        = aws_s3_bucket.source_bucket.arn
      storage_class = "STANDARD"
    }
  }
}

