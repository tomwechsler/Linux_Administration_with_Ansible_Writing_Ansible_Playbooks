#We count the lines in the chrony.conf file
wc -l /etc/chrony.conf 

#What about now?
grep -Ev '^($|#)' /etc/chrony.conf | wc -l

#We create our own file
mkdir ~/ansible/chrony ; grep -Ev '^($|#)' /etc/chrony.conf > ~/ansible/chrony/chrony.conf



On both Ubuntu and RedHat the configuration for Chrony is we documented. The same file will
work across all systems allowing us to clean the file and use this as the corporate time
configuration file.

#Change to the home directory
cd ~

echo 'chrony_conf: /etc/chrony.conf' >> ~/group_vars/redhat
echo 'chrony_svc: chronyd' >> ~/group_vars/redhat

echo 'chrony_conf: /etc/chrony/chrony.conf' >> ~/group_vars/debian
echo 'chrony_svc: chrony' >> ~/group_vars/debian



The path of the configuration file varies between the system, as does the service name.