#!/bin/zsh
focuspath=~"/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/.obsidian/themes/Shimmering Focus.css"
grep -E "<+ " "$focuspath" | cut -c1- | sed -e "s/ \*\///" -e "s/\/\*//" -e "s/<<< /\t\t- /" -e "s/<< /\t- /" -e "s/< /- /" | tail -n +2 | pbcopy
osascript -e 'display notification "" with title "ToC copied."'
