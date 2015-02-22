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
	mkdir -p out/
	cp "/tmp/`basename '$(CURDIR)'`"/main.pdf ./out

clean:
	rm -rf "/tmp/`basename '$(CURDIR)'`"
	rm -rf output

.PHONY: view clean deploy quiet 
