# Demonstration inputs for static analysis only.
resource "aws_ebs_volume" "backup" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = false
}

resource "aws_ebs_volume" "logs" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = false
}

resource "aws_ebs_volume" "data" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = false
}

resource "aws_ebs_volume" "archive" {
  availability_zone = "us-east-1a"
  size              = 8
  encrypted         = false
}

resource "aws_security_group" "administration" {
  name = "iac-lab-administration"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
