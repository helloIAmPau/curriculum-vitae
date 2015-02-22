all: view

single: quiet
	open "/tmp/`basename '$(CURDIR)'`"/*.pdf

quiet:
	mkdir -p "/tmp/`basename '$(CURDIR)'`"
	lualatex -output-directory="/tmp/`basename '$(CURDIR)'`" main.tex

view: quiet
	make quiet
	open "/tmp/`basename '$(CURDIR)'`"/*.pdf

deploy: quiet
	cp "/tmp/`basename '$(CURDIR)'`"/main.pdf ./
	open main.pdf

clean:
	rm -rf "/tmp/`basename '$(CURDIR)'`"
	rm -rf output

.PHONY: view clean deploy quiet 
