#Templates

#The templates are created using the Jinja2 format. Let's start right away with a playbook and template. 
#Before starting we will test that the web server is installed (with the browser) on the systems.

vim temp.yaml

---

- name: 'conditionals'
  hosts: server
  become: yes
  tasks:
   - name: 'install apache2'
     apt: name=apache2 update_cache=yes state=latest
	   when: ansible_os_family == "Debian"

   - name: 'install httpd'
     yum: name=httpd state=latest
	   when: ansible_os_family == "RedHat"

- name: 'templates'
  vars:
   file_version: 1.0
  tasks:
   - name: 'install index'
     template:
	    src: index.html.j2
	    dest: /var/www/html/index.html
	    mode: 0777

#Now we create the template.

vim index.html.j2

<html>
<center>
<h1>Der Computername von diesem System ist {{ ansible_hostname }}</h1>
<h3>Das Betriebsystem von diesem Computer ist {{ ansible_os_family }}</h3>
<small>Die Dateiversion ist {{ file_version }}<small>
{# Dieser Eintrag wird nicht in der index-html Datei zu finden sein #}
</center>
</html>

ansible-playbook temp.yaml

#Let's start the playbook.
#Now the version can be adjusted in the template. Then run the playbook again and refresh the browser.

ansible-playbook temp.yaml

#Also we see that in the index.html file the comment is not visible.