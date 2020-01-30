#
# Makefile for js-example
#
.PHONY: usage edit build run clean git
#----------------------------------------------------------------------------------
usage:
	@echo "usage: make [down|build|install|run]"
#----------------------------------------------------------------------------------
VERSION=0.8.0
down d:
	wget https://github.com/meetecho/janus-gateway/archive/v$(VERSION).tar.gz
	tar xvzf v$(VERSION).tar.gz

build b:
	cd janus-gateway-$(VERSION); \
		./autogen.sh; \
		./configure --prefix=/usr/local/janus --enable-post-processing PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig; \
		make

install:
	cd janus-gateway-$(VERSION); \
		sudo make install; \
		sudo make configs

run r:
	/usr/local/janus/bin/janus

web w:
	open http://localhost:8080
	simplehttpserver

kill k:
	pkill simplehttpserver

clean:
	rm -f v$(VERSION).tar.gz
	rm -rf janus-gateway-$(VERSION)
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


