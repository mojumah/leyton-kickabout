sudo yum update -y
sudo yum install docker
sudo usermod -a -G docker ec2-user
sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
