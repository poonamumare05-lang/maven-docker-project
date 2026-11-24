
#!/bin/bash

# Update Ubuntu
sudo apt update
sudo apt upgrade -y

# Install Java 21
sudo apt install fontconfig openjdk-21-jre -y

# Verify Java
java -version

# Add Jenkins key
sudo mkdir -p /etc/apt/keyrings

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add Jenkins repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
sudo apt update
sudo apt install jenkins -y

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Maven
sudo apt install maven -y

# Install Docker
sudo apt install docker.io -y

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# Add Jenkins to Docker group
sudo usermod -aG docker jenkins

# Restart services
sudo systemctl restart docker
sudo systemctl restart jenkins

# Jenkins initial password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
