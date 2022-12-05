#Change the playbook a bit
vim user.yaml

---

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
        password: "{{ 'Password1' | password_hash('sha512') }}"
        update_password: 'on_create'
      when: user_create == 'yes'  
    - name: 'Allow SSH Authentication via key for vagrant account to new remote account'
      authorized_key:
        user: "{{ user_account | default('ansible') }}"
        state: 'present'
        manage_dir: true
        key: "{{ lookup('file', '/home/vagrant/.ssh/id_ecdsa.pub') }}"
      when: user_create == 'yes'  
    - name: 'Delete User Account'
      user:
        name: "{{ user_account | default('ansible') }}"
        state: 'absent'
        remove: true
      when: user_create == 'no'


#Lets check
ssh -i ~/.ssh/id_ecdsa ansible@centos

ssh -i ~/.ssh/id_ecdsa ansible@ubuntu