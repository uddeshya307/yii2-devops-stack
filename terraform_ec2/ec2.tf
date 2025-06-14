provider "aws" {
  region     = var.aws_region
}

resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name               = aws_key_pair.yii2app_key_pair.key_name
  
  root_block_device {
    volume_size = 30
    volume_type = "gp3"  # You can also use "gp2", "io1", etc.
    delete_on_termination = true
  }

 user_data = <<-EOF
              #!/bin/bash
              sudo dnf install -y git
              sudo dnf install -y ansible
              echo "Cloning GitHub repository"
              git clone https://github.com/uddeshya307/ansible-yii2-app-deploy.git /home/ec2-user/ansible-yii2-app-deploy
              cd /home/ec2-user/ansible-yii2-app-deploy/ansible-playbook
              ansible-playbook -i inventories/hosts.ini playbook.yml
              EOF

  
  tags = {
    Name = ""
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_p"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust for security
  }
  
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
