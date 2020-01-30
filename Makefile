#
# Makefile for janus-go
#
.PHONY: usage edit build run clean git
#----------------------------------------------------------------------------------
usage:
	@echo "usage: make [edit|git]"
#----------------------------------------------------------------------------------
edit e:
	vi janus.go

edit-test et:
	vi janus_test.go

test t:
	go test -v
#----------------------------------------------------------------------------------
git g:
	@echo "> make (git:g) [update|store]"
git-update gu:
	git add .
	git commit -a -m "update information"
	git push
git-store gs:
	git config credential.helper store
#----------------------------------------------------------------------------------


