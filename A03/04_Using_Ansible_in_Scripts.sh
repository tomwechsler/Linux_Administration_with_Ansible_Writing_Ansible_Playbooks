#!/bin/bash
cd ~/home/vagrant/ 
ansible -b all -m package -a 'name=tree state=present'
ansible -b all -m file -a \ 
'path=/etc/localtime state=link src=/usr/share/zoneinfo/Europe/London force=true' 



If we do not like the idea of YAML and Playbooks, it is possible to use ad-hoc commands in
scripts. Here we install tree and set the local timezone.