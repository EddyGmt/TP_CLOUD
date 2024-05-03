provider "aws" {
  region = var.aws-region
  access_key = var.aws-access-key
  secret_key = var.aws-secret-key
}

resource "aws_key_pair" "key" {
  key_name = "TP_CLOUD.pub"
  public_key = file("./TP_CLOUD.pub")
}

resource "aws_instance" "my_ec2_instance" {
  key_name = aws_key_pair.key.key_name
  ami           = var.ami
  instance_type = var.instance-type
  vpc_security_group_ids = [ aws_security_group.websg.id ]
}

resource "aws_security_group" "websg" {
  name = "web-sg01"
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"  // "-1" signifie tous les protocoles
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "null_resource" "tutu" {

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./TP_CLOUD")
    host = aws_instance.my_ec2_instance.public_ip
    timeout = "2m"
  }

  provisioner "file" {
    source      = "./script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/script.sh",
        "/tmp/script.sh"
      ]
  }

  depends_on = [aws_instance.my_ec2_instance]
}