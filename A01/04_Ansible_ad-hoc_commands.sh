#Create a file with the file module
ansible centos -m file -a "path=/home/vagrant/file2.txt state=touch mode=700"

#Create a file with the copy module
ansible centos -m copy -a "dest=/home/vagrant/file3.txt content='stuff' force=no mode=700"

#Change the permission
ansible centos -m file -a "dest=/home/vagrant/file2.txt mode=600"

#Change the user and group owner
ansible centos -b -m file -a "dest=/home/vagrant/file2.txt mode=600 owner=root group=root"

#Create a directory
ansible centos -m file -a "dest=/home/vagrant/newdir mode=755 state=directory"

#Remove the directory
ansible centos -m file -a "dest=/home/vagrant/newdir mode=755 state=directory state=absent"

#Install the apache web server (present, installed or latest)
ansible centos -b -m yum -a "name=httpd state=latest"

#(Optional) Deinstall the apache web server
ansible centos -b -m yum -a "name=httpd state=absent"

#Start a service (run twice first orange second green)
ansible centos -b -m service -a "name=httpd state=started"

#Restart a service
ansible centos -b -m service -a "name=httpd state=restarted"

#Reload a service
ansible centos -b -m service -a "name=httpd state=reloaded"

#Stopp a service
ansible centos -b -m service -a "name=httpd state=stopped"

#Enable a service (it will ne started at boot)
ansible centos -b -m service -a "name=httpd enabled=yes"

#Just a check
ansible centos -b -m service -a "name=httpd enabled=yes" --check
ansible centos -b -m service -a "name=httpd enabled=no" --check

#Check with the shell module
ansible centos -m shell -a "systemctl status httpd"

#Create a user
ansible centos -b -m user -a 'name=user2 state=present home=/home/user2 shell=/bin/bash'

#Change the primary group
ansible centos -b -m user -a "name=user2 group=wheel"

