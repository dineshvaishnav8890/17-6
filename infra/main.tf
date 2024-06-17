provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "frontend" {
  ami           = "ami-09040d770ffe2224f" # 
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              docker run -d -p 80:80 ${dineshvaishnav}/my-frontend:latest
              EOF

  tags = {
    Name = "frontend"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-09040d770ffe2224f" #
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              docker run -d -p 5000:5000 ${dineshvaishnav}/my-backend:latest
              EOF

  tags = {
    Name = "backend"
  }
}

