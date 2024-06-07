set quiet := true

publish:
    [[ "$OSTYPE" =~ "darwin" ]] && osascript -e 'display notification "Publishing…" with title "Shimmering Focus"'
    zsh ./publish.sh

build:
    zsh ./source/build.sh
