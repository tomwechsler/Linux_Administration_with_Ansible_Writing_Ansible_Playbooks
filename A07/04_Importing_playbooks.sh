#We import the playbooks
vim p1.yaml

- import_playbook: archive.yaml
- import_playbook: vdo.yaml

#And the last and final check
ansible-playbook p1.yaml
