#We create a new directory for our new project
mkdir -p ~/ansible/loop; cd ~/ansible/loop

vim loopdevice.yaml 
- name: 'Manage Disk File' 
  hosts: almahost
  become: true
  gather_facts: false
  tasks:
    - name: "Create Raw Disk File"
      command:
        cmd: 'fallocate -l 1G /root/disk0'

