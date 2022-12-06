#Prerequisite:
#1. Add new disc in Virtualbox (min. 8GB) for the centos VM

#Check
lsblk

#The install task
vim install.yaml

- name: install
  package:
    name:
      - vdo
      - kmod-kvdo
    state: latest

#The service task
vim service.yaml

- name: start
  service:
    name: vdo
    state: started
    enabled: true

#The createvdo task
vim createvdo.yaml

- name: create 
  vdo:
    name: vdo1
    state: present
    device: /dev/sdb
    logicalsize: 20G


#The filesystem task
vim fs.yaml

- name: format
  filesystem:
    type: xfs
    dev: /dev/mapper/vdo1

#The mounpoint task
vim mountpoint.yaml

- name: mountpoint
  file:
    path: /vdo1
    state: directory

#The mount task
vim mount.yaml

- name: mount
  mount:
    path: /vdo1
    fstype: xfs
    state: mounted
    src: /dev/mapper/vdo1
    opts: defaults,x-systemd.requires=vdo.service

#Now we create the playbook with all the tasks in it
vim vdo.yaml

- name: vdo
  hosts: centos
  become: true
  gather_facts: false
  tasks:
  - include_tasks: install.yaml
  - include_tasks: service.yaml
  - include_tasks: createvdo.yaml
  - include_tasks: fs.yaml
  - include_tasks: mountpoint.yaml
  - include_tasks: mount.yaml

#Lets run the playbook
ansible-playbook vdo.yaml

#Did it work?
mount -t XFS