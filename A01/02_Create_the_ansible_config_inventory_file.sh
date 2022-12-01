#Create the inventory in the ansible configuration and hosts file

vim .ansible

vim inventory

[server]
centos
ubuntu

#Exit the editor

#List the inventory
ansible-inventory --list

#List the inventory as graph
ansible-inventory --graph

#List the inventory in yaml format
ansible-inventory --list -y

#List inventory with debug module
ansible all -m debug -a 'var=groups'
ansible all -m debug -a 'var=groups.keys()'