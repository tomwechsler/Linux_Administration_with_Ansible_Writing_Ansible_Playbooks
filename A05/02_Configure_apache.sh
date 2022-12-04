#We configure the web server
vim apache.yaml

- name: 'Add welcome page' 
  copy: 
    dest: '/var/www/html/index.html'
    content: '<h1>Welcome to the web site</h1>'


The web content is simpler as the path is consistent on RedHat based systems and Debian
based systems. The copy module has a lot of flexibility to investigate that add interest.

- name: 'Start and enable web server' 
  service: 
    name: 'httpd' 
    state: 'started' 
    enabled: true

We are back to having issues where the service name differs.