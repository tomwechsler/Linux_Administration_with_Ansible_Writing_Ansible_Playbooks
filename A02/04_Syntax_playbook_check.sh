#Let's create a folder for our ansible "project"
mkdir -p ~/ansible/simple

#Move in to the new folder
cd ~/ansible/simple

vim tree.yaml

- name: Install a package
  hosts: all
  become: true
  tasks:
    - name: Install tree
      package:
        name: tree
        state: present

#Exit the editor

#Install the yamllint feature
sudo yum install yamllint

#We can install the ansible-lint Python modules that will check you Playbook against style guidelines.
yamllint tree.yaml

#We can also check the correct syntax is employed in the playbook.
ansible-playbook tree.yaml --syntax-check

#Going beyond syntax checking we can try the option -C to check the operation without
#implementing change. This works best with the verbose option -v.
ansible-playbook -C -v tree.yaml