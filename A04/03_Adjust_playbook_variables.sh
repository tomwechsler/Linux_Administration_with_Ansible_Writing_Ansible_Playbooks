#We adjust the playbook

vim loopdevice.yaml

- name: 'Manage Disk File'
  hosts: all
  gather_facts: false
  vars:
    disk_file: '/root/disk0'
    loop_dev: '/dev/loop100'
  tasks:
    - name: 'Create raw disk file'
      command:
        cmd: "fallocate -l 1G {{ disk_file }}"
        creates: "{{ disk_file }}"