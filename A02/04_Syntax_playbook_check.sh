#Install the ansible-lint feature
pip3 install ansible-lint --user

#We can install the ansible-lint Python modules that will check you Playbook against style guidelines.
ansible-lint -v FirstPlay.yaml

#We can also check the correct syntax is employed in the playbook.
ansible-playbook FirstPay.yaml --syntax-check

#Going beyond syntax checking we can try the option -C to check the operation without
#implementing change. This works best with the verbose option -v.
ansible-playbook -C -v FirstPlay.yaml