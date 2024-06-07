set quiet := true

build:
    cd ./source && zsh ./build.sh

publish:
    cd ./source && zsh ./build.sh "publish" && cd ..
    [[ "$OSTYPE" =~ "darwin" ]] && osascript -e 'display notification "Publishing…" with title "Shimmering Focus"'
    zsh ./publish.sh
