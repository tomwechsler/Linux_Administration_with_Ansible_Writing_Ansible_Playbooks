#Command module
- does not use the shell (BASH/SH)
- Pipe and redirect do not work

#Module Shell
- Supports pipe and redirect
- Attention: wrong commands can affect the whole system

#Module raw
- sends commands via ssh
- python is not needed

#Protect against shell injection
MYVAR='myvalue;ls -la /etc/hosts'

echo $MYVAR

ansible centos -m command -a "echo $MYVAR"

ansible centos -m shell -a "echo $MYVAR"

#No text file available because module command does not support redirect
ansible server  -m command -a 'echo "test" > /root/test.txt'

#No it works
ansible server -m shell -a 'echo "test" > /root/test.txt'

#Create a file with the file module
ansible almahost -m file -a "path=/home/vagrant/file2.txt state=touch mode=700"

#Create a file with the copy module
ansible almahost -m copy -a "dest=/home/vagrant/file3.txt content='stuff' force=no mode=700"

#Change the permission
ansible almahost -m file -a "dest=/home/vagrant/file2.txt mode=600"

#Change the user and group owner
ansible almahost -m file -a "dest=/home/vagrant/file2.txt mode=600 owner=root group=root"

#Create a directory
ansible almahost -m file -a "dest=/home/vagrant/newdir mode=755 state=directory"

#Remove the directory
ansible almahost -m file -a "dest=/home/vagrant/newdir mode=755 state=directory state=absent"

#Install the apache web server (present, installed or latest)
ansible almahost  -m yum -a "name=httpd state=latest"

#(Optional) Deinstall the apache web server
ansible almahost  -m yum -a "name=httpd state=absent"

#Start a service (run twice first orange second green)
ansible almahost  -m service -a "name=httpd state=started"

#Restart a service
ansible almahost  -m service -a "name=httpd state=restarted"

#Reload a service
ansible almahost  -m service -a "name=httpd state=reloaded"

#Stopp a service
ansible almahost  -m service -a "name=httpd state=stopped"

#Enable a service (it will ne started at boot)
ansible almahost  -m service -a "name=httpd enabled=yes"

#Just a check
ansible almahost -m service -a "name=httpd enabled=yes" --check
ansible almahost -m service -a "name=httpd enabled=no" --check

#Check with the shell module
ansible almahost -m shell -a "systemctl status httpd"

#Create a user
ansible almahost -m user -a 'name=user2 state=present home=/home/user2 shell=/bin/bash'

#Change the primary group
ansible almahost -m user -a "name=user2 group=wheel"

#Change back the primary group and add an additional group
ansible almahost -m user -a "name=user2 group=user2 groups=wheel"

#Delete the user
ansible almahost -m user -a "name=user2 state=absent"

#Add and delete a group
ansible almahost -m group -a "name=accounting state=present"

ansible almahost -m group -a "name=accounting state=absent"