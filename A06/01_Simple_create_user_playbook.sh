#Create a new user

vim simpleuser.yaml


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