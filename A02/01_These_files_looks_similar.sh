#Cat file file1 

user: 
      name: bob 
      dept: sales 

user: 
      name: bob 
      dept: sales 



In YAML, leading whitespace is significant, meaning we do not need the array of brackets
seen in JSON. Indent related keys with two spaces, convert tabs to spaces to make life easier.

#Cat -vet file file1

user:$
^Iname: bob$ 
^Idept: sales$ 

user:$ 
        name: bob$ 
        dept: sales$ 



But they are not, one uses 8 spaces as an indent level the other uses a tab.