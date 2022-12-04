chmod u+x shell.sh

./shell.sh

scp shell.sh tux@192.168.33.12: 
scp shell.sh tux@192.168.33.13:

ssh tux@192.168.33.12 -C '~/shell.sh'
ssh tux@192.168.33.13 -C '~/shell.sh'



Locally, it is easy to execute the script. For the remote system we must copy the file across
and then execute it.