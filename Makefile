
#
# Environment
#

SHELL:=/bin/bash
PATH:=./node_modules/.bin:$(PATH)
OUT_DIR?=build

#
# Sources
#

SRC:= $(shell find lib -name '*.css')

#
# Targets
#

$(OUT_DIR): node_modules $(SRC)
	atomify --output $@/build

node_modules: package.json
	npm install

clean:
	rm -fr $(OUT_DIR)

.PHONY: clean

