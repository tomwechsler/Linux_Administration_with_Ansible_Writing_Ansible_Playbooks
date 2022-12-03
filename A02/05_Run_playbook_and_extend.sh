#Imagine if we can create the variables based on facts. 
#The following example:

ansible centos -m setup

ansible centos -m setup -a "filter=*family*"

vim tree.yaml

- name: Install a package
  hosts: all
  become: true
  gather_facts: true
  tasks:
    - name: Install tree
      package:
        name: tree
        state: present
    - name: Print Progress
      debug:
        msg: "This is {{ ansible_distribution }}" # {{ ansible_os_family }}