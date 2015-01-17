# These are bash functions to be sourced in ~/.bashrc

export EDGE_ROOT=${EDGE_ROOT:-~/edge}

function e {
	action="${1:-default}"
	shift
	path="$EDGE_ROOT"/"$action"
    
    
	if [ -f "$path" ]; then
		if head -n 1 "$path" | grep -q "^#!"; then
			"$path" "$@"
		else
			cat "$path" | edge-prettify | less -r -FX
		fi
	else
		echo -e '\E[0;31mnaw!\E[0m'
	fi
}

_TabComplete_Edge () {
	local cur="${COMP_WORDS[COMP_CWORD]}"
	COMPREPLY=( $(compgen -W "$(ls "$EDGE_ROOT")" -- "$cur") )
}

complete -F _TabComplete_Edge -o filenames e
