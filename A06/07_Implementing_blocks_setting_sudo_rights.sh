#Change the playbook a bit
vim user.yaml

---

- name: 'Manage Local Account'
  hosts: 'ctrlnode'
  become: true
  gather_facts: false
  tasks:
    - name: 'Manage User Account'
      user:
        name: 'vagrant'
        state: 'present'
        generate_ssh_key: true
        ssh_key_type: 'ecdsa'
        ssh_key_file: '.ssh/id_ecdsa'

- name: 'Create and Manage Remote Ansible User'
  hosts: all
  become: true
  gather_facts: false
  tasks:
    - name: 'Create User Account, SSH Auth and Sudoers Entry'
      block:
        - name: 'Create Ansible User'
          user:
            name: 'ansible'
            state: 'present'
            shell: '/bin/bash'
            password: "{{ 'Password1' | password_hash('sha512') }}"
            update_password: 'on_create'       
        - name: 'Allow SSH Authentication via key for vagrant account to new remote account'
          authorized_key:
            user: 'ansible'
            state: 'present'
            manage_dir: true
            key: "{{ lookup('file', '/home/vagrant/.ssh/id_ecdsa.pub') }}"
        - name: 'Copy Sudoers file' 
          copy:
            dest: '/etc/sudoers.d/ansible'
            content: 'ansible ALL=(root) NOPASSWD: ALL'
      when: user_create == 'yes'        
    - name: 'Delete User Account'
      user:
        name: 'ansible'
        state: 'absent'
        remove: true
      when: user_create == 'no'


#Start the playbook
ansible-playbook user.yaml -e user_create=yes

#Lets check
ssh -i ~/.ssh/id_ecdsa ansible@centos

sudo -l

ssh -i ~/.ssh/id_ecdsa ansible@ubuntu

sudo -l