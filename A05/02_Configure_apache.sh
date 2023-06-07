#We configure the web server
vim apache.yaml

- name: 'Add welcome page' 
  copy: 
    dest: '/var/www/html/index.html'
    content: '<h1>Welcome to the web site</h1>'




- name: 'Start and enable web server' 
  service: 
    name: 'httpd' 
    state: 'started' 
    enabled: true
