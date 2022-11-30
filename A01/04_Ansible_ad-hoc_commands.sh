#Create a file with the file module
ansible centos -m file -a "path=/home/vagrant/file2.txt state=touch mode=700"

#Create a file with the copy module
ansible centos -m copy -a "dest=/home/vagrant/file3.txt content='stuff' force=no mode=700"

#Change the permission
ansible centos -m file -a "dest=/home/vagrant/file2.txt mode=600"

#Change the user and group owner
ansible centos -b -m file -a "dest=/home/vagrant/file2.txt mode=600 owner=root group=root"

