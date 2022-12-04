#If yout get some locale warnings
export LC_ALL="en_US.UTF-8"

#Install the epel release
sudo yum install -y epel-release

#Install python3
sudo yum install -y python3

#If more then one python version is on the host
sudo alternatives --set python /usr/bin/python3

#Install Ansible
sudo yum install -y ansible

#Install python arg-completion
sudo yum install -y python3-argcomplete

#Set argcomplete
sudo activate-global-python-argcomplete

#Check the version
ansible --version