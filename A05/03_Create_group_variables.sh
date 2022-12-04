cd ~

cat inventory

mkdir ~/group_vars

vim ~/group_vars/redhat 
apache_pkg: httpd 
apache_srv: httpd 

vim ~/group_vars/debian 
apache_pkg: apache2 
apache_svc: apache2



The inventory file we have created includes the RedHat group which includes the rhel and
stream groups. The ubuntu group is for the single ubuntu system.