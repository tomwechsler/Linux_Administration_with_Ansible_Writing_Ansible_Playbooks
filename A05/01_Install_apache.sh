#Another project
mkdir -p ~/ansible/apache; cd ~/ansible/apache 

vim apache.yaml

- name: 'Manage Apache Deployment' 
  hosts: centos 
  become: true 
  gather_facts: false 
  tasks: 
    - name 'Install Apache Web Server' 
      package: 
        name: 'httpd' 
        state: 'present' 


