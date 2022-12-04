#We create a new directory for our new project
mkdir -p ~/ansible/loop; cd ~/ansible/loop

vim loopdevice.yaml 
- name: 'Manage Disk File' 
  hosts: centos
  become: true
  gather_facts: false
  tasks:
    - name: "Create Raw Disk File"
      command:
        cmd: 'fallocate -1 1G /root/disk0'

