#We extend the playbook

vim loopdevice.yaml

- name: 'Manage Disk File' 
  hosts: almahost
  become: true
  gather_facts: false
  tasks:
    - name: "Create Raw Disk File"
      command:
        cmd: 'fallocate -l 1G /root/disk0'
        creates: '/root/disk0'



