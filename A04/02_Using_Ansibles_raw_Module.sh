ansible all -i 18.172.45.3 -b -m raw -a "dnf install -y python3" 



Using the raw module, we can execute commands on a host where SSh execution is allowed.
Using AWS`s CentOS image, Python is not installed. This means we first need to install Python
before continuing to configure the system with Ansible.