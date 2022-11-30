#Install python3 on the remote system (if needed)
ansible server -m raw -b -a "yum install python3"
