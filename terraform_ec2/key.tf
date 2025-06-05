resource "tls_private_key" "yii2app_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "yii2app_key_pair" {
  key_name   = "yii2app-key"
  public_key = tls_private_key.yii2app_key.public_key_openssh
}

resource "local_file" "yii2app_private_key" {
  content         = tls_private_key.yii2app_key.private_key_pem
  filename        = "${path.module}/yii2app-key.pem"
  file_permission = "0600"
}