#!/bin/bash

### Author: Louis
### Date: 6-13-22
##Description: Jenkins set-up using script. Please use  sudo -i to be root before doing installation

echo "First step-Java installation, please wait"
yum install java-1.8.0-openjdk-devel
sleep 2
echo "Enable Java repository"
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
if [ $? -eq 0]
then
echo "install jenkins repository with wget command"
else
yum install wget -y
echo "Go ahead and install it with the above command"
fi
sleep 2
sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo
echo "disable key check on repo"
sleep 2
echo "Install latest version of jenkin"
yum install jenkins -y
sleep 2
echo "Enable jenkins start system boot"
systemctl enable jenkins
sleep 2
echo "adjust firewall"
firewall-cmd --permanent --zone=public --add-port=8080/tcp
if [ $? -eq 0 ]
then
echo "run firewall-cmd for 8080/tcp"
sleep 2
else
systemctl start firewalld
echo "Restart firewall"
sleep 2
echo "And Reload firewall"
firewall-cmd --reload
fi
echo " Go to google chrome and type the IP address followed by port :8080. The next screen wiil appear"

