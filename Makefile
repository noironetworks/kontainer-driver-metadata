TARGETS := $(shell ls scripts)

.dapper:
	@echo Downloading dapper
	@wget https://releases.rancher.com/dapper/latest/dapper-`uname -s`-`uname -m` -O .dapper.tmp
	@@chmod +x .dapper.tmp
	@./.dapper.tmp -v
	@mv .dapper.tmp .dapper

$(TARGETS): .dapper
	./.dapper $@

.DEFAULT_GOAL := ci

.PHONY: $(TARGETS)
