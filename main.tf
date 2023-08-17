provider "aws" {
  region = "eu-west-1"  
}

resource "aws_instance" "AppServer" {
  ami           = "ami-0ab14756db2442499"  
  instance_type = "t2.micro"               
  key_name      = "key"     
  user_data = file("script.sh")
}

resource "aws_security_group" "AppServerSG" {
  name_prefix = "AppServerSG-"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AppServer"
  }
}