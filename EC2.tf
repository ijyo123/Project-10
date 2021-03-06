resource "aws_instance" "webserver1-p10" {
  ami           = var.p10-ami-id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-HTTP-P10.id]
  subnet_id =  aws_subnet.project10-publicsubnet1.id
  availability_zone = "eu-west-2a"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver2-p10" {
  ami           = var.p10-ami-id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-HTTP-P10.id]
  subnet_id =  aws_subnet.project10-publicsubnet2.id
  availability_zone = "eu-west-2b"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver3-p10" {
  ami           = var.p10-ami-id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.SG-HTTP-P10.id]
  subnet_id =  aws_subnet.project10-publicsubnet2.id
  availability_zone = "eu-west-2b"
  user_data         = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}