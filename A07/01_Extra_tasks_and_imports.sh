#A new project folder
mkdir -p ansible/extra

#We create a task
vim backup.yaml

- name: 'Backup /etc directory on system'
  archive:
    path: '/etc/'
    dest: "/tmp/etc-{{ ansible_hostname }}.tgz"

#Now the playbook






We can create compressed tar archives using Ansible and the archive module. The backup is
local unless the destination path specified is a network mount. Note that this is just a task we
can store this as its own YAML file but it cannot be executed independently.

Creating independent tasks allow for us to import them into Plays that need them. Although
created below tasks: they do not form part of the tasks: dictionary as the list is aligned with the
play. Using include_tasks we can process variables generated from the Playbook, using
import_tasks the assignment is static and processed before the rest of the Play.