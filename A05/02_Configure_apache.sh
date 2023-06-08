#We configure the web server
vim apache.yaml

- name: 'Add welcome page' 
  copy: 
    dest: '/var/www/html/index.html'
    content: '<h1>Welcome to the web site</h1>'

name: 'Add welcome page' 
  copy: 
    dest: '/var/www/html/index.html'
    content: |
      This is a simple page
      <h1>welcome</h1>

name: 'Add welcome page' 
  copy: 
    dest: '/var/www/html/index.html'
    src: 'index.html'

vim index.html
<h1>This is my page</h1>
This is a web page

mkdir web

mv index.html web

echo "a second page" > web/page2.html

ls web

name: 'Add welcome page' 
  copy: 
    dest: '/var/www/html/'
    src: 'web/'


