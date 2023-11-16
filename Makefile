.PHONY: publish

publish:
	[[ "$$OSTYPE" =~ "darwin" ]] && osascript -e 'display notification "Building…" with title "Shimmering Focus"' ; \
	zsh ./build.sh
