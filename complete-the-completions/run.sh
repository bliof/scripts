#!/bin/bash

set -e

# Most probably you'll have to symlink few more things e.g. mount.linux, umount.linux
# Starting the shell will be slower

completions="/usr/share/bash-completion/completions"
enabled_completions="/etc/bash_completion.d"

for c in `compgen -c | uniq | sort`; do
    [ "$c" == '.' ] && continue

    if [ -e "$completions/$c" ]; then
        if [ ! -e "$enabled_completions/$c" ]; then
            sudo ln -sv "$completions/$c" "$enabled_completions/$c"
        fi;
    fi;
done
