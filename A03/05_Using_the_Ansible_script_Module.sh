#Create a new script

vim myscript.sh

#!/bin/bash 
echo "Hello World!" 
cat /etc/hosts

ansible all -m script -a "/home/vagrant/myscript.sh"



Using the script module, we can create a script on the Ansible controller and have the script
execute on the remote nodes, without the script needing to exist on the remote nodes. This is
useful where the commands that need to be executed are more complex.