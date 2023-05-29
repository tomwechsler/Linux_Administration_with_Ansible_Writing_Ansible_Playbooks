#Let's create a folder for our ansible "project"
mkdir -p ~/ansible/simple

#Move in to the new folder
cd ~/ansible/simple 

vim FirstPlay.yaml

- name: My First Play 
  hosts: all 
  become: true 
  tasks: 
    -name: My First Task 
     package: 
       name: tree 
       state: present 



