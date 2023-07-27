resource "aws_instance" "ansible_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.ansible_server.id]
  key_name = "talent-academy-lab"
#   vpc_id      = aws_vpc.lab-vpc.id
  subnet_id = aws_subnet.public.id

user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install ansible -y
sudo nano /etc/ansible/hosts


EOF

tags = {
    Name = "HelloSubhasri"
}
}

resource "aws_eip" "ansible_server_ip" {
instance = aws_instance.ansible_server.id
vpc      = true
}