#We create a new task
vim schedule.yaml

- name: 'Scheduled backup of /etc'
  ansible.builtin.cron:
    name: 'backup /etc'
    weekday: '5'
    minute: '0'
    hour: '2'
    user: 'root'
    job: "tar -czf /tmp/etc-{{ ansible_hostname }}.tgz /etc"
    cron_file: etc_backup


#We extend our playbook
vim archive.yaml

- name: 'Backup and schedule backups'
  hosts: 'all'
  become: true
  gather_facts: true
  tasks:
  - include_tasks: backup.yaml
  - include_tasks: schedule.yaml

#Run the playbook
ansible-playbook archive.yaml

#Was the job created?
sudo ls /etc/cron.d/

sudo cat /etc/cron.d/etc_backup




To schedule a similar backup we can use the cron system in Linux. Again, we can create and
independent task to include where it is needed.