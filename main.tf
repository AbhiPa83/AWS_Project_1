provider "aws" {
  region = var.region
}
resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.ubuntu.id
# instance_type = var.instance_type
# instance_type = var.instance_type_list[1] 
  instance_type = var.instnace_type_map["prod"]
  count = 3
  tags = {
    Environment = "Testing Server-${count.index}"
  }
  key_name  = "Test_projects"
  user_data = <<-EOF
#!/bin/bash
              sudo yum update -y
              sudo yum install -y java-1.8.0-openjdk-devel

              # Install Jenkins
              sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
              sudo yum install -y jenkins
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              EOF
}

output "for_output_map" {
  value = aws_instance.jenkins[*].public_ip
}
