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
    - name: 'Delete User Account'
      user:
        name: "{{ user_account | default('ansible') }}"
        state: 'absent'
        remove: true
      when: user_create == 'no' 


#Now we can use the variables
ansible-playbook -e user_account=joe -e user_create=yes user.yaml -v






If we want the user to authenticate via a password this must be set. The Password value must
be passed encrypted and so we use the filter password_hash to create a SHA512 password hash.
We cant read the passwords hashed value, so adding the update_password argument ensures
we only set the password on user creation.