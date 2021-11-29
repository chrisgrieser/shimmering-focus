#!/bin/zsh
grep -E " <+ " obsidian.css | cut -c4- | sed -e "s/ \*\///" -e "s/<<< /\t\t- /" -e "s/<< /\t- /" -e "s/< /- /" | tail -n +2 | pbcopy
