#!/bin/bash
if [ -f '/usr/bin/apt' ]; then 
  sudo apt update -y
  sudo apt install -y tree 
else 
  sudo yum install -y tree 
fi



Just dealing with two different Linux distributions adds an immense amount of complexity. This
is just the script to install one package. We still must copy the script to each system and
execute on each system.