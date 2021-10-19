#!/bin/zsh

source $ZDOTDIR/functions.zsh

for file in $ZDOTDIR/conf/*; do source $file; done
for file in $ZDOTDIR/lib/*; do source $file; done
