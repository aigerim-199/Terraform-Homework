provider aws {
    region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")

}

data "aws_ami" "amazon_linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}


#1-instance
resource "aws_instance" "web1" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
  #availability_zone = "us-east-2a"
  subnet_id = "subnet-0923c8f1a28b28e90"
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("apache.sh")
  
 

   tags = {
    Name = "web-1"

  }
  }

  output ec2-1 {
    value = aws_instance.web1.public_ip
    sensitive = true

}


#2-instance
resource "aws_instance" "web2" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
  #availability_zone = "us-east-2b"
  subnet_id = "subnet-0d496f31e9a9818a2"
   key_name = aws_key_pair.deployer.key_name
   vpc_security_group_ids = [aws_security_group.allow_tls.id]
   user_data = file("apache.sh")

   tags = {
    Name = "web-2"
  }
}

output ec2-2 {
    value = aws_instance.web1.public_ip
    sensitive = true

}

#3-instance
resource "aws_instance" "web3" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t2.micro"
  #availability_zone = "us-east-2c"
  subnet_id = "subnet-0bcffea6caebbf5ab"
   key_name = aws_key_pair.deployer.key_name
   vpc_security_group_ids = [aws_security_group.allow_tls.id]
   user_data = file("apache.sh")


   tags = {
    Name = "web-3"
  }
}

output ec2-3 {
    value = aws_instance.web1.public_ip
    sensitive = true

}