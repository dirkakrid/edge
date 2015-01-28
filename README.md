# Sample .bashrc

```sh
EDGE_ROOT=~/edge
source ~/path/to/edge.sh

# Add shortcuts for showing notes (e) and editing notes (ee)
function e  { edge "$@"; }
function ee { vim -c 'set ft=sh' $EDGE_ROOT/"$1"; }

# Set up tab completions for the shortcuts
complete -F _TabComplete_Edge -o filenames e ee
```
