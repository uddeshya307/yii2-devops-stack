variable "aws_region" {
  default = "us-east-2"
}

variable "aws_access_key" {
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
}

variable "github_token" {
  description = "GitHub Personal Access Token"
}

variable "ami_id" {
  default = "ami-06c8f2ec674c67112" # Amazon Linux 2023 in us-east-2 (update if needed)
}

variable "instance_type" {
  default = "t2.micro"
}

