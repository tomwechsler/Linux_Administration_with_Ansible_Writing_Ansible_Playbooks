#Create the inventory and the ansible configuration file
vim .ansible.cfg

[defaults]
inventory = inventory

[privilege_escalation]
become = true

#exit

ansible-config view

ansible-config dump --only-changed

vim inventory

[redhat]
centos
[debian]
ubuntu
[server:children]
redhat
debian

#Exit the editor

#List the inventory
ansible --list all

ansible --list ungrouped

ansible --list server

#List the inventory
ansible-inventory --list

#List the inventory as graph
ansible-inventory --graph

#List the inventory in yaml format
ansible-inventory --list -y

#List inventory with debug module
ansible all -m debug -a 'var=groups'
ansible all -m debug -a 'var=groups.keys()'