PROMPT='
$fg[cyan]%n: $fg[yellow]$(get_pwd)
$reset_color→ '

function get_pwd()
{
	echo "${PWD/$HOME/~}"
}

