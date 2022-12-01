#Check if python3 is available
ansible centos -m shell -a 'python3 -V'

#Install python3 on the remote system (if needed)
ansible centos -b -m raw -a "yum install -y python3"

#We can test
ansible centos -m shell -a 'python3 -V'