#!/bin/zsh
grep "< " obsidian.css | cut -c6- | sed -e "s/ \*\///" | tr "\n" "\0" | xargs -0 -I § echo "- §" | tail -n +2 | pbcopy
