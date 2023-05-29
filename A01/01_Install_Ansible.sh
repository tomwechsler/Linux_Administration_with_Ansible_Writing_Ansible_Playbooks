#If yout get some locale warnings
export LC_ALL="en_US.UTF-8"

#If this does not work, use:
sudo dnf install -y glibc-langpack-en

#Install the epel release
sudo dnf install -y epel-release

#Install python3
sudo dnf install -y python3

#If more then one python version is on the host
sudo alternatives --set python /usr/bin/python3

#Install Ansible
sudo dnf install -y ansible

#Install python arg-completion
sudo dnf install -y python3-argcomplete

#Set argcomplete
sudo activate-global-python-argcomplete

#Check the version
ansible --version