
#
# Path
#

SHELL:=/bin/bash
PATH:=./node_modules/.bin:$(PATH)


#
# Settings
#

REPORTER?=spec


#
# Sources
#

SRC:=$(shell find -E lib -regex '/^.*(html|js|json|css)$$/')
TESTS:=$(shell find lib -name '*.test.js')


#
# Targets
#

build: node_modules $(SRC)
	mkdir -p $@
	atomify
	cp index.html $@/
	@echo ""
	@echo "    styles was built!"
	@echo ""

node_modules: package.json
	npm install

test: build
	karma start	

clean:
	rm -fr build

.PHONY: clean test build

