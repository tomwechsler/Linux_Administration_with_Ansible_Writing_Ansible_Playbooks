#Change the playbook a bit
vim user.yaml

- name: 'Manage User Account'
  hosts: all 
  become: true 
  gather_facts: false 
  tasks: 
    - name 'Manage User' 
      user: 
        name: "{{ user_account | default('ansible') }}" 
        state: 'present' 
        shell: '/bin/bash' 


#Now we can use the variables
ansible-playbook -e user_account=joe user.yaml

#Without the variable => default will be used
ansible-playbook user.yaml




To add flexibility to the Playbook we can use variables. Using the Jinja default filter we can also
provide a default value if a value is not supplied.