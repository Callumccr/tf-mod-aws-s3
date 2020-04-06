data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_elb_service_account" "default" {
  count = var.enabled && var.attach_elb_log_delivery_policy ? 1 : 0
}

data "aws_iam_policy_document" "elb_log_delivery" {
  count = var.enabled && var.attach_elb_log_delivery_policy ? 1 : 0

  statement {
    sid = ""

    principals {
      type        = "AWS"
      identifiers = data.aws_elb_service_account.default.*.arn
    }

    effect = "Allow"

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.default[0].id}/*",
    ]
  }
}


data "aws_iam_policy_document" "bucket_uploads" {
  count = var.enabled && var.allow_upload_bucket_objects == true ? 1 : 0
  statement {
    sid       = "AllowAll"
    effect    = "Allow"
    actions   = ["*"]
    resources = ["arn:aws:s3:::${element(aws_s3_bucket.default.*.id, count.index)}/*"]

    principals {
      identifiers = ["${var.aws_assume_role_arn}"]
      type        = "AWS"
    }
  }
}


data "aws_iam_policy_document" "encrypted_uploads" {
  count = var.enabled && var.allow_encrypted_uploads_only ? 1 : 0

  statement {
    sid       = "DenyIncorrectEncryptionHeader"
    effect    = "Deny"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${join("", aws_s3_bucket.default.*.id)}/*"]

    principals {
      identifiers = ["*"]
      type        = "*"
    }

    condition {
      test     = "StringNotEquals"
      values   = [var.sse_algorithm]
      variable = "s3:x-amz-server-side-encryption"
    }
  }

  statement {
    sid       = "DenyUnEncryptedObjectUploads"
    effect    = "Deny"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.default[0].id}/*"]

    principals {
      identifiers = ["*"]
      type        = "*"
    }

    condition {
      test     = "Null"
      values   = ["true"]
      variable = "s3:x-amz-server-side-encryption"
    }
  }
}
