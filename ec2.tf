resource "aws_instance" "app" {
  ami                         = "ami-0ce107ae7af2e92b5" #Amazon Linux2
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.app.id}"]
  subnet_id                   = "${aws_subnet.public-subnet.id}"
  key_name                    = "事前に登録したキー"
  associate_public_ip_address = true

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  user_data     = file("./user_data.sh")

  tags = {
    Name = "${var.name}-app"
  }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_eip_association" "eip-association" {
  instance_id   = "${aws_instance.app.id}"
  allocation_id = "${aws_eip.eip.id}"
}

output "public_dns" {
  value = "${aws_eip.eip.public_dns}"
}
