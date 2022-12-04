#We extend the playbook

vim loopdevice.yaml

- name: 'Manage Disk File' 
  hosts: centos
  become: true
  gather_facts: false
  tasks:
    - name: "Create Raw Disk File"
      command:
        cmd: 'fallocate -1 1G /root/disk0'
        creates: '/root/disk0'



Using the meta-parameter creates, the task only runs is the file does not exist. In this Playbook
we create a raw file using fallocate. There is not a module to do this, so we use the command
module. As the command fallocate creates a file we can easily check for this file before
execution.