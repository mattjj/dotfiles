#!/bin/bash

# NOTE this isn't robust at all

if [[ $OSTYPE == darwin* ]]
then
    cat >> .tmux.conf <<EOF
# for tmux, c.f. https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
# tried to get the commented command below to work but had no luck
# if-shell '[[ $OSTYPE == darwin* ]]' 'set -g default-command "reattach-to-user-namespace -l zsh"'
set-option -g default-command "reattach-to-user-namespace -l zsh"
EOF
fi

loc=$(cd `dirname $0` && pwd)
cd
for f in `find "$loc" -type f -name '.*'`
do
    ln -s $f .
done
