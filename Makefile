
#
# Path
#

SHELL:=/bin/bash
PATH:=./node_modules/.bin:$(PATH)
COMPASS?=$(shell type -p compass)


#
# Settings
#

REPORTER?=spec


#
# Sources
#

SASS:=$(shell find lib -name '*.scss')
SRC:=$(shell find -E lib -regex '/^.*(html|js|json)$$/') $(SASS:%.scss=%.css)
TESTS:=$(shell find lib -name '*.test.js')


#
# Targets
#

build: node_modules $(SRC)
	mkdir -p $@
	atomify
	@echo ""
	@echo "    styles was built!"
	@echo ""

%.css: %.scss
	$(COMPASS) compile

node_modules: package.json
	npm install

test: build
	karma start

clean:
	rm -fr build

.PHONY: clean test

