current_dir = $(shell pwd)
export PATH := $(PATH):$(current_dir)/deps/fswatch/out/bin:/opt/texbin/

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
	make quiet
	mkdir -p out/
	cp "/tmp/`basename '$(CURDIR)'`"/main.pdf ./out

develop: view
	./deps/fswatch/out/bin/fswatch-run * "make quiet"

clean:
	rm -rf "/tmp/`basename '$(CURDIR)'`"
	rm -rf output

docker:
	docker build -t helloiampau/cv:0.0.0 .
	docker run -t -i -v $(current_dir):/repo helloiampau/cv:0.0.0 make deploy

.PHONY: docker view clean deploy quiet 
