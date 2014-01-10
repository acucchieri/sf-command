# bash completion for sf

# Return an array containing symfony commands
_sf_cmds()
{
    local sf_cmd=`/usr/bin/php << 'PHP'
<?php
$cur = '';
$cmds= '';
$output = array();
$script = PHP_BINDIR . '/php ' . 'app/console list --raw';
$return = exec($script, $output);
if ($output) {
    foreach ($output as $value) {
        $cmds .= strtok($value, ' ');
        $cmds .= ' ';
    }
}
echo $cmds;
?>
PHP`

    cmds=( `echo $sf_cmd` )
}


# Return a string containing command options
_sf_opts()
{
    local args
    if [ $# = 0 ] ; then
        args=''
    else
        args=$1
    fi

    script=$(cat <<'PHP'
$cmds = (isset($argv[1])) ? $argv[1] : '';
$opts = '';
$script = PHP_BINDIR . '/php ' . 'app/console ' . $cmds . ' --help --xml';
$return = exec($script, $output);
if ($output) {
    $xmlstr = implode("\n", $output);
    $xml = new SimpleXMLElement($xmlstr);
    foreach ($xml->options->option as $option) {
        $opts .= $option['name'] . ' ';
    }
}
echo trim($opts);
PHP
)

    opts=$($(which php) -r "$script" ${args}  < /dev/null);
}


_sf()
{
    COMPREPLY=()
    local cur prev
    local -a words
    if type _get_comp_words_by_ref &>/dev/null ; then
        _get_comp_words_by_ref -n : cur prev words
    else
        cur=$2 prev=$3 words=("${COMP_WORDS[@]}")
    fi

    if [[ ${cur} == -* ]] ; then
        _sf_opts $prev
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi

    _sf_cmds
    local i c cmd subcmd
    for (( i=1; i < ${#words[@]}-1; i++ )) ; do
        [[ -n $cmd ]] && subcmd=${words[i]} && break
    done

    COMPREPLY=( $( compgen -W '${cmds[@]}' -- "$cur" ) )

    __ltrim_colon_completions "$cur"
} &&
complete -F _sf sf
