#We create a new playbook

vim localuser.yaml

---

- name: 'Manage Local Account'
  hosts: 'ctrlnode'
  become: true
  gather_facts: false
  tasks:
    - name: 'Manage User Account'
      user:
        name: "{{ user_account }}"
        state: 'present'
        generate_ssh_key: true
        ssh_key_type: 'ecdsa'
        ssh_key_file: '.ssh/id_ecdsa'
    
    
ansible-playbook -e user_account=$USER localuser.yaml



When creating or managing users we can also generate SSH Key Pairs. 
We can use the key for authenticating to remote systems. If we manage our own user account, 
we can add a key pair for our account that can be used for authentication. 
This needs only to be configured on the controller.