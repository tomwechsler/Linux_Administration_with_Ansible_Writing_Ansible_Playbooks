#Extend the scrip

vim shell.sh

#!/bin/bash
sudo timedatectl set-timezone 'Europe/Zurich'
if [ -f '/usr/bin/apt' ]; then 
  sudo apt-get update -y
  sudo apt-get install -y tree 
else 
  sudo yum install -y tree 
fi



Just dealing with two different Linux distributions adds an immense amount of complexity. This
is just the script to install one package. We still must copy the script to each system and
execute on each system.