#Install python3 on the remote system (if needed)
ansible centos -b -m raw -a "yum install python3"

#We can test
ansible centos -b -m ping