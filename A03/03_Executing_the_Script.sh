chmod u+x shell.sh

./shell.sh

scp shell.sh vagrant@centos: 
scp shell.sh vagrant@ubuntu:

ssh vagrant@centos -C '~/shell.sh'
ssh vagrant@ubuntu -C '~/shell.sh'



Locally, it is easy to execute the script. For the remote system we must copy the file across
and then execute it.