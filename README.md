#Sf Command

`sf` command is an alias of php app/consol symfony command
Use:

    sf cache:clear

instead of:

    php app/console cache:clear

`sf` command allow you to add some extra code after Symfony 2 command execution

`sf` command also provides autocompletion for Symfony 2 commands:

    sf c<tab>

return:

    cache:clear    cache:warmup    config:dump-reference  container:debug


## Install

Add sf command file in a path directory (eg: /usr/local/bin)
Add sf.bash in bash autocomplete directory (eg: /etc/bash_completion.d)

Reload your bash


## Exemple


