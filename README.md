#Sf Command

`sf` command is an alias of `php app/console` symfony command
Use

    sf cache:clear

instead of

    php app/console cache:clear

`sf` command allow you to add some extra code after Symfony 2 command execution

`sf` command also provides autocompletion for Symfony 2 commands

    sf c<tab>

return

    cache:clear    cache:warmup    config:dump-reference  container:debug


## Install

Add *sf* command file in a path directory (eg: /usr/local/bin)

Add *sf.bash* in bash autocomplete directory (eg: /etc/bash_completion.d)

Reload your bash


## Usage

You must run `sf` command from your project root directory

    [john@foo Symfony2]# sf do<tab>
                       # sf doctrine:
                       # sf doctrine:<tab>
    cache:clear-metadata        database:create             generate:crud               generate:form               mapping:info                schema:create               schema:validate             
    cache:clear-query           database:drop               generate:entities           mapping:convert             query:dql                   schema:drop                 
    cache:clear-result          ensure-production-settings  generate:entity             mapping:import              query:sql                   schema:update               
                       # sf doctrine:s<tab>
                       # sf doctrine:schema:
                       # sf doctrine:schema:up<tab>
                       # sf doctrine:schema:update
                       # sf doctrine:schema:update --<tab>
    --ansi           --dump-sql        --env             --help           --no-debug           --process-isolation  --shell         --version            
    --complete       --em              --force           --no-ansi        --no-interaction     --quiet              --verbose       
                       # sf doctrine:schema:update --du<tab>
                       # sf doctrine:schema:update --dump-sql 
