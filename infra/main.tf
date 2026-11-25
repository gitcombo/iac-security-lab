# Demonstration inputs for static analysis only.
resource "aws_kms_key" "storage" {
  description             = "EBS encryption in the IaC lab"
  enable_key_rotation     = true
  deletion_window_in_days = 30
}

resource "aws_ebs_volume" "backup" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = true
  kms_key_id        = aws_kms_key.storage.arn
  tags = {
    Project = "iac-security-lab"
  }
}

resource "aws_ebs_volume" "logs" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = true
  kms_key_id        = aws_kms_key.storage.arn
  tags = {
    Project = "iac-security-lab"
  }
}

resource "aws_ebs_volume" "data" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = true
  kms_key_id        = aws_kms_key.storage.arn
  tags = {
    Project = "iac-security-lab"
  }
}

resource "aws_ebs_volume" "archive" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = true
  kms_key_id        = aws_kms_key.storage.arn
  tags = {
    Project = "iac-security-lab"
  }
}
