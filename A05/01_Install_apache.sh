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


Installing Apache will work without issues across the RHEL and CentOS systems but, hard
coding the package to httpd will fail on the Ubuntu system as it uses the package name
apache2.