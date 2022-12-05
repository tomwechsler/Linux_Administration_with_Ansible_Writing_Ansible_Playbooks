#Change the playbook a bit
vim user.yaml

- name: 'Create and Manage Users'
  hosts: all
  become: true
  gather_facts: false
  tasks:
    - name: 'Create User Account'
      user:
        name: "{{ user_account | default('ansible') }}"
        state: 'present'
        shell: '/bin/bash'
      when: user_create == 'yes'  
    - name: 'Delete User Account'
      user:
        name: "{{ user_account | default('ansible') }}"
        state: 'absent'
        remove: true
      when: user_create == 'no' 


#Now we can use the variables
ansible-playbook -e user_account=joe -e user_create=yes user.yaml -v

ansible-playbook -e user_account=joe -e user_create=no user.yaml -v

#Without the variable => default will be used
ansible-playbook user.yaml


