#Extend the playbook
vim apache.yaml

- name: 'Manage Apache Webserver Deployment'
  hosts: all
  become: true
  gather_facts: false
  tasks:
    - name: 'Install the Apache Webserver'
      package:
        name: "{{ apache_pkg }}"
        state: 'present'
    - name: 'Add welcome page' 
      copy: 
         dest: '/var/www/html/index.html'
         content: '<h1>Welcome to the web site</h1>'
    - name: 'Ensure web server is running and enabled'
      service:
        name: "{{ apache_svc }}"
        state: 'started'
        enabled: true
    


