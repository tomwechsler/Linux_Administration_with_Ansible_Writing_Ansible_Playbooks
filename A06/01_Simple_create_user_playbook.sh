#Expand the inventory with our control host.
vim inventory

[redhat]
centos
ctrlnode
[debian]
ubuntu
[server:children]
redhat
debian

#Make sure to edit also the /etc/hosts file
vim /etc/hosts

#We create a new project directory
mkdir -p ansible/user

#Create a new user

vim user.yaml


- name: 'Manage User Account' 
  hosts: all 
  become: true 
  gather_facts: false 
  tasks: 
    - name 'Manage User' 
      user: 
        name: 'ansible'  
        state: 'present' 
        shell: '/bin/bash' 



To create a user account, we do not need to do a lot. We add the eplicit shell for the user as
the default will differ across Linux distributions. The account is created but, we have not set a
password. We will manage passwords later.